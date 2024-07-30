import 'package:bookly_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:bookly_hive/models/note_model.dart';
import 'package:bookly_hive/views/edit_note_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(
              noteModel: noteModel,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(
            noteModel.color,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                noteModel.title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  noteModel.subTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<NotesCubit>(context).getAllNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                noteModel.date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
