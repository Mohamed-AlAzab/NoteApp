part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

final class LoadNoteEvent extends NoteEvent {}

final class AddNoteEvent extends NoteEvent {
  final NoteModel note;

  const AddNoteEvent(this.note);
}

final class EditNoteEvent extends NoteEvent {
  final int index;
  final NoteModel note;

  const EditNoteEvent(this.index, this.note);

  @override
  List<Object> get props => [note.title, note.content, note.date, note.color];
}

final class DeleteNoteEvent extends NoteEvent {
  final int index;

  const DeleteNoteEvent(this.index);
}
