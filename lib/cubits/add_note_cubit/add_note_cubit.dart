import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../views/models/note_model.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
Color? color  = const Color(0xffE3D7FF);
  addNotes(NoteModel noteModel) {
    noteModel.color =color!.value ;
    emit(AddNoteLoading());
    var notes = Hive.box<NoteModel>(kNotesBox);
    notes.add(noteModel).then((value) {
      emit(AddNoteSuccess());
    }).catchError((onError) {
      emit(AddNoteFailure(onError));
    });
  }


}
