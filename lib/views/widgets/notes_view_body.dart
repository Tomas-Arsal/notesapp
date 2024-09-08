import 'package:flutter/material.dart';
import 'list_view_note.dart';
import 'notes_view_body_appbar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key,  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children:   [
          SizedBox(
            height: 30,
          ),
          CustomViewBodyAppbar(icon: Icon(Icons.search), title: 'Notes',),
          Expanded(

              child: ListViewNote()),
        ],
      ),
    );
  }
}
