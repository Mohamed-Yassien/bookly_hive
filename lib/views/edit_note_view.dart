import 'package:bookly_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:bookly_hive/models/note_model.dart';
import 'package:bookly_hive/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.noteModel.title;
    contentController.text = widget.noteModel.subTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onTap: () {
                widget.noteModel.title = titleController.text;
                widget.noteModel.subTitle = contentController.text;
                widget.noteModel.save();
                BlocProvider.of<NotesCubit>(context).getAllNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hintText: 'title',
              controller: titleController,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'content',
              maxLines: 5,
              controller: contentController,
            ),
          ],
        ),
      ),
    );
  }
}
