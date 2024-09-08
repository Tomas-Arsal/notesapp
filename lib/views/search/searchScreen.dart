import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';
import '../../constants.dart';
import '../models/note_model.dart';
import '../notes_view.dart';
import '../widgets/list_view_note.dart';
import '../widgets/list_view_note_item.dart';

class SearchFinder extends StatelessWidget {
  final String query;

  SearchFinder({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: Hive.box<NoteModel>(kNotesBox).listenable(),
          builder: (context, Box<NoteModel> contactsBox, _) {
            ///* this is where we filter data
            var results = query.isEmpty
                ? contactsBox.values.toList() // whole list
                : contactsBox.values
                    .where((c) => c.title.toLowerCase().contains(query))
                    .toList();

            return results.isEmpty
                ? Center(
                    child: Text(
                      'No results found !',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      // passing as a custom list
                      final NoteModel contactListItem = results[index];

                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListViewNote()));
                        },
                        title: ListViewNoteItem(noteModel: contactListItem),
                      );
                    },
                  );
          }),
    );
  }
}

class SearchWidget extends SearchDelegate<NoteModel> {
  var TextSearch = TextEditingController();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  // تساوى ال appbar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop() ;
      },
    );
  }

// لاجل اظهار النتائج بعد انتهاء البحث
  @override
  Widget buildResults(BuildContext context) {
    return SearchFinder(query: query);
  }

// لاجل الاقتراحات اثناء البحث
  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Start Searching' , style: TextStyle(color: Colors.white),)) ;
  }
}
