import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/widget/coustom_app_bar.dart';
import 'package:note_app/view/widget/coustom_bottom_sheet.dart';
import 'package:note_app/view/widget/note_container.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  NoteModel note = NoteModel(
    title: 'title',
    content: 'content',
    date: DateTime.now(),
    color: 0xffF08A4B,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xff262626),
            appBar: CoustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: state is NoteLoaded ? state.notes.length : 0,
                itemBuilder: (lcontext, index) {
                  if (state is NoteLoaded) {
                    return NoteContainer(
                      note: state.notes[index],
                      onTapDelete: () {
                        context.read<NoteBloc>().add(DeleteNoteEvent(index));
                      },
                      onTapEdit: () => _showEditNoteBottomSheet(
                        context,
                        state.notes[index],
                        index,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xffF08A4B),
              onPressed: () => _showAddNoteBottomSheet(context),
              child: Icon(Icons.add, color: Color(0xff262626)),
            ),
          );
        },
      ),
    );
  }

  void _showAddNoteBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      backgroundColor: Color(0xff262626),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      context: parentContext,
      builder: (_) {
        return BlocBuilder<NoteBloc, NoteState>(
          bloc: parentContext.read<NoteBloc>(),
          builder: (bbcontext, state) {
            titleController.clear();
            contentController.clear();
            return CoustomBottomSheet(
              titleBottomSheet: 'Note',
              titleButton: 'Add Note',
              titleController: titleController,
              contentController: contentController,
              onTap: (color) {
                if (titleController.text.isNotEmpty &&
                    contentController.text.isNotEmpty) {
                  parentContext.read<NoteBloc>().add(
                    AddNoteEvent(
                      NoteModel(
                        title: titleController.text,
                        content: contentController.text,
                        date: DateTime.now(),
                        color: color,
                      ),
                    ),
                  );
                  titleController.clear();
                  contentController.clear();
                  Navigator.pop(parentContext);
                }
              },
            );
          },
        );
      },
    );
  }

  void _showEditNoteBottomSheet(BuildContext parentContext, note, index) {
    showModalBottomSheet(
      backgroundColor: Color(0xff323232),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      context: parentContext,
      builder: (_) {
        return BlocBuilder<NoteBloc, NoteState>(
          bloc: parentContext.read<NoteBloc>(),
          builder: (bbcontext, state) {
            titleController.text = note.title;
            contentController.text = note.content;
            return CoustomBottomSheet(
              titleBottomSheet: 'Note',
              titleButton: 'Edit Note',
              titleController: titleController,
              contentController: contentController,
              color: note.color,
              onTap: (color) {
                if (titleController.text.isNotEmpty &&
                    contentController.text.isNotEmpty) {
                  parentContext.read<NoteBloc>().add(
                    EditNoteEvent(
                      index,
                      NoteModel(
                        title: titleController.text,
                        content: contentController.text,
                        date: DateTime.now(),
                        color: color,
                      ),
                    ),
                  );
                  titleController.clear();
                  contentController.clear();
                  Navigator.pop(parentContext);
                }
              },
            );
          },
        );
      },
    );
  }
}
