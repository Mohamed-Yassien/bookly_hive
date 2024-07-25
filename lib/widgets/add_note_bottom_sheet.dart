
import 'package:bookly_hive/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:bookly_hive/cubits/add_note_cubit/add_note_states.dart';
import 'package:bookly_hive/widgets/add_note_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteStates>(
      listener: (context, state) {
        if (state is AddNoteSuccessState) {
          Navigator.pop(context);
        } else if (state is AddNoteErrorState) {
          debugPrint(state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteLoadingState,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}
