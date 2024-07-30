import 'package:bookly_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:bookly_hive/cubits/notes_cubit/notes_state.dart';
import 'package:bookly_hive/widgets/notes_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return NotesItem(
                noteModel: cubit.notes[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: cubit.notes.length,
          ),
        );
      },
    );
  }
}
