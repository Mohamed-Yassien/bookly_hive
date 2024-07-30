import 'package:bookly_hive/cubits/notes_cubit/notes_state.dart';
import 'package:bookly_hive/models/note_model.dart';
import 'package:bookly_hive/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);


  List<NoteModel> notes = [];

  getAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(GetNotesSuccessState());
  }
}
