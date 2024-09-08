import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../constants.dart';
import '../../views/models/note_model.dart';
part 'notes_fetch_state.dart';

class NotesFetchCubit extends Cubit<NotesFetchState> {
  NotesFetchCubit() : super(NotesFetchInitial());
  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesFetchSuccess());
  }
}
