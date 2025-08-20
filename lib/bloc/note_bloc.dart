import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:note_app/model/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  Box<NoteModel> box = Hive.box<NoteModel>('note_box');

  NoteBloc() : super(NoteInitial()) {
    on<LoadNoteEvent>(_onLoadNoteEvent);
    on<AddNoteEvent>(_onAddNoteEvent);
    on<EditNoteEvent>(_onEditNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);

    add(LoadNoteEvent());
  }

  void _onLoadNoteEvent(LoadNoteEvent event, Emitter<NoteState> emit) {
    List<NoteModel> notes = box.values.toList();
    emit(NoteLoaded(notes));
  }

  void _onAddNoteEvent(AddNoteEvent event, Emitter<NoteState> emit) {
    box.add(event.note);
    add(LoadNoteEvent());
  }

  void _onEditNoteEvent(EditNoteEvent event, Emitter<NoteState> emit) {
    var currentState = state;
    if (currentState is NoteLoaded) {
      NoteModel? note = box.getAt(event.index);
      if (note != null) {
        box.putAt(event.index, event.note);
      }
      add(LoadNoteEvent());
    }
  }

  void _onDeleteNoteEvent(DeleteNoteEvent event, Emitter<NoteState> emit) {
    box.deleteAt(event.index);
    add(LoadNoteEvent());
  }
}
