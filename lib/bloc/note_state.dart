part of 'note_bloc.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

final class NoteInitial extends NoteState {}

final class NoteLoaded extends NoteState {
  final List<NoteModel> notes;

  const NoteLoaded(this.notes);

  @override
  List<Object> get props => [notes];
}
