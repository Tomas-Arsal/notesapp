import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/views/widgets/add_note_form.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {}
        if (state is AddNoteSuccess) {
          // BlocProvider.of<NotesFetchCubit>(context).fetchAllNotes();
          // Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddNoteForm(),
          )),
        );
      },
    );
  }
}
