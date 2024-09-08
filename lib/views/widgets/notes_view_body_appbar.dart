import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/styles.dart';
import '../../cubits/notes_cubit/notes_fetch_cubit.dart';
import '../search/searchScreen.dart';

class CustomViewBodyAppbar extends StatefulWidget {
  const CustomViewBodyAppbar(
      {Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;

  final Icon icon;

  @override
  State<CustomViewBodyAppbar> createState() => _CustomViewBodyAppbarState();
}

class _CustomViewBodyAppbarState extends State<CustomViewBodyAppbar> {
  @override
  void initState() {
    BlocProvider.of<NotesFetchCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          const Text(
            'Notes',
            style: Styles.textStyle18,
          ),
          const Spacer(),
          IconButton(
            onPressed:(){
              showSearch(
                context: context,
                delegate: SearchWidget(),
              );
            } ,
              icon: const Icon(Icons.search),
    ),
        ],
      ),
    );
  }
}
