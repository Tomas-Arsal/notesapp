part of 'notes_search_cubit.dart';

@immutable
abstract class NotesSearchState {}

class NotesSearchInitial extends NotesSearchState {}

class NewGetSearchLoadingState extends NotesSearchState {}

class NewGetSearchSuccessState extends NotesSearchState {}

class NewGetSearchErrorState extends NotesSearchState {
  final String error;

  NewGetSearchErrorState(this.error);
}
