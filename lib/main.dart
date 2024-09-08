import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/views/models/note_model.dart';
import 'package:notesapp/views/notes_view.dart';

import 'boc_observer/boc_Observer.dart';
import 'constants.dart';
import 'cubits/add_note_cubit/add_note_cubit.dart';
import 'cubits/notes_cubit/notes_fetch_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 // Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const notes());
}

class notes extends StatelessWidget {
  const notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NotesFetchCubit()..fetchAllNotes(),
          ),
          BlocProvider(
            create: (context) => AddNoteCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'notes',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: kHomeColor,
          ),
          debugShowCheckedModeBanner: false,
          home: NotesView(),
          routes: {
            NotesView.route:(context)=> NotesView(),
          },
        ),
      );
  }
}
