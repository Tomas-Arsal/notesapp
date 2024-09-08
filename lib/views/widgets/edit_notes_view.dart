import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes_cubit/notes_fetch_cubit.dart';
import '../models/note_model.dart';
import 'edit_color_list_view.dart';
import 'edit_notes_view_appbar.dart';
import 'text_field.dart';

class CustomEditNotesView extends StatefulWidget {
  const CustomEditNotesView({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<CustomEditNotesView> createState() => _CustomEditNotesViewState();
}

class _CustomEditNotesViewState extends State<CustomEditNotesView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomEditNotesViewAppbar(
          icon: const Icon(
            Icons.check,
            size: 30,
          ),
          title: 'Edit',
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subTitle = content ?? widget.note.subTitle;
            widget.note.save();
            BlocProvider.of<NotesFetchCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
        ),
        Column(
          children: [
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 1,
            ),
            EditColorListView(note: widget.note),
          ],
        ),
      ],
    ));
  }
}
