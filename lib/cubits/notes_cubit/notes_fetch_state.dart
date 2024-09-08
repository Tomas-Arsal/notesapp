part of 'notes_fetch_cubit.dart';

@immutable
abstract class NotesFetchState {}

class NotesFetchInitial extends NotesFetchState {}

class NotesFetchSuccess extends NotesFetchState {}
