import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:intl/intl.dart';
import 'color_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, supTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 36,),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            onSaved: (value) {
              supTitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(height: 16,),

          const ColorListView(),

          const SizedBox(height: 16,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state){
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate = DateFormat('dd-MM-yyyy').format(currentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: supTitle!,
                        date: formattedCurrentDate,
                        color: kPrimaryColor.value
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },
              );
            },
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
