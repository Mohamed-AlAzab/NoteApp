import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'note_list_view.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),

          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}