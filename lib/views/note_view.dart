import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/add_note_bottom_sheet.dart';
import 'package:noteapp/views/widgets/note_view_body.dart';

import '../constants.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NoteViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
            return const AddNoteBottomSheet();
            }
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}