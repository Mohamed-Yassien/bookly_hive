import 'dart:ui';

import 'package:bookly_hive/cubits/add_note_cubit/add_note_states.dart';
import 'package:bookly_hive/models/note_model.dart';
import 'package:bookly_hive/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());

  List<Color> colors = const [
    Color(0xffc7522a),
    Color(0xffe5c185),
    Color(0xfffbf2c4),
    Color(0xff74a892),
    Color(0xff008585),
  ];

  int selectedIndex = 0;

  changeSelectedIndex(index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }

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
