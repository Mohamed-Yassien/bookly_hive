import 'package:bookly_hive/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:bookly_hive/cubits/add_note_cubit/add_note_states.dart';
import 'package:bookly_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:bookly_hive/widgets/add_note_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AddNoteSuccessState) {
            BlocProvider.of<NotesCubit>(context).getAllNotes();
            Navigator.pop(context);
          } else if (state is AddNoteErrorState) {
            debugPrint(state.error);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState,
            child: Padding(
              padding: EdgeInsets.only(
                right: 25,
                left: 25,
                top: 30,
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
