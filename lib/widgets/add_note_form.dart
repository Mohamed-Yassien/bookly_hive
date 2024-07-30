import 'package:bookly_hive/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:bookly_hive/cubits/add_note_cubit/add_note_states.dart';
import 'package:bookly_hive/models/note_model.dart';
import 'package:bookly_hive/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();

  String title = '';
  String content = '';

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddNoteCubit>();
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'title',
            onSaved: (val) {
              title = val!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: 'content',
            maxLines: 5,
            onSaved: (val) {
              content = val!;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return SizedBox(
                height: 34 * 2,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return cubit.selectedIndex == index
                        ? CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: cubit.colors[index],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              cubit.changeSelectedIndex(index);
                            },
                            child: CircleAvatar(
                              radius: 34,
                              backgroundColor: cubit.colors[index],
                            ),
                          );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: cubit.colors.length,
                ),
              );
            },
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoadingState,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var date = DateTime.now();
                    var formattedDate = DateFormat.MEd().format(date);
                    NoteModel noteModel = NoteModel(
                      title: title,
                      subTitle: content,
                      date: formattedDate,
                      color: cubit.colors[cubit.selectedIndex].value,
                    );
                    context.read<AddNoteCubit>().addNote(noteModel: noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
