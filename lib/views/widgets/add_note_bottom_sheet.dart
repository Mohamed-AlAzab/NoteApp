import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/notes/notes_cubit.dart';
import 'add_note_form.dart';
import 'package:flutter/src/widgets/media_query.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet ({super.key});
  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state){
          if(state is AddNoteFailure){}

          if(state is AddNoteSuccess){
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();

            Navigator.pop(context);
          }
        },
        builder: (context, state){
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false ,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                  child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}