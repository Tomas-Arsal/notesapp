
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String error;

  AddNoteFailure(this.error);
}
class NewGetSearchLoadingState extends AddNoteState {}

class NewGetSearchSuccessState extends AddNoteState {}

class NewGetSearchErrorState extends AddNoteState {
  final String error;

  NewGetSearchErrorState(this.error);
}
