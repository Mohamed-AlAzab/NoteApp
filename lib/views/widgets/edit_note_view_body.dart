import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_app_bar.dart';
import 'package:noteapp/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 60,),
          CustomAppBar(
            title: 'Edit Notes',
            icon: Icons.check,
          ),
          SizedBox(height: 50,),
          CustomTextField(
              hint: 'Title'
          ),
          SizedBox(height: 16,),
          CustomTextField(
            hint: 'content',
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
