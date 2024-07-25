import 'package:bookly_hive/cubits/add_note_cubit/add_note_states.dart';
import 'package:bookly_hive/models/note_model.dart';
import 'package:bookly_hive/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  addNote({required NoteModel noteModel}) async {
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notesBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteErrorState(e.toString()));
    }
  }
}
