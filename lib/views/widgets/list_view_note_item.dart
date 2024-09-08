import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/utils/styles.dart';
import '../models/note_model.dart';
import '../notes_view.dart';
import 'edit_notes_view.dart';

class ListViewNoteItem extends StatelessWidget {
  const ListViewNoteItem({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CustomEditNotesView(
                      note: noteModel,
                    )));
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 2, top: 10),
                  child: Text(
                    noteModel.title,
                    style: Styles.textStyle20,
                  ),
                ),
                subtitle: Text(
                  noteModel.subTitle,
                  style: Styles.textStyle20.copyWith(color: Colors.grey),
                ),
                trailing: IconButton(
                    onPressed: () {
                      noteModel.delete();
                      Navigator.of(context)
                          .pushReplacementNamed(NotesView.route);
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                      color: CupertinoColors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 5),
                child: Text(
                  noteModel.date,
                  style: Styles.textStyle16.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
