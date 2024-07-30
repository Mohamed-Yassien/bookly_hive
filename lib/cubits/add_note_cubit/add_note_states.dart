abstract class AddNoteStates {}

class AddNoteInitialState extends AddNoteStates {}

class AddNoteLoadingState extends AddNoteStates {}

class AddNoteSuccessState extends AddNoteStates {}

class AddNoteErrorState extends AddNoteStates {
  final String error;
  AddNoteErrorState(this.error);
}

class ChangeSelectedIndexState extends AddNoteStates{}
