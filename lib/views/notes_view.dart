import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/views/widgets/notes_view_body.dart';
import '../cubits/notes_cubit/notes_fetch_cubit.dart';
import 'add_note_bottom_sheet.dart';

class NotesView extends StatefulWidget {
  static const route='NotesView';
  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {


  late NotesFetchCubit fetch;

  @override
  void initState() {
    super.initState();
    fetch = NotesFetchCubit();
    fetch.fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesFetchCubit, NotesFetchState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    context: context, builder: (context) {
                  return const AddNoteButtomSheet();
                });
              },
              child: const Icon(Icons.add),
            ),
            body: const NotesViewBody(),
          ),
        );
      },
    );
  }
}
