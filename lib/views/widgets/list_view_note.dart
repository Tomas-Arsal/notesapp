import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes_cubit/notes_fetch_cubit.dart';
import '../models/note_model.dart';
import 'list_view_note_item.dart';

class ListViewNote extends StatelessWidget {
  const ListViewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = BlocProvider
        .of<NotesFetchCubit>(context)
        .notes!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BlocBuilder<NotesFetchCubit, NotesFetchState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListViewNoteItem(
                      noteModel: notes[index],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
