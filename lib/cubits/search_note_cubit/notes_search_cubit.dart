import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../views/models/note_model.dart';

part 'notes_search_state.dart';

class NotesSearchCubit extends Cubit<NotesSearchState> {
  NotesSearchCubit() : super(NotesSearchInitial());
  static NotesSearchCubit get(context) => BlocProvider.of(context);

  List<dynamic> search = [];

getSearch(String query) {
    emit(NewGetSearchLoadingState());

    // contactsBox.values.where((c) => c.name.toLowerCase().contains(query)).toList();
      emit(NewGetSearchSuccessState());
  }
}
