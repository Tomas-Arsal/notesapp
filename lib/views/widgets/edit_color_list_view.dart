import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import 'colorListView.dart';
import 'color_item.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({Key? key, required this.note}) : super(key: key);
  final NoteModel note ;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}
class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndex ;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color)) ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color  = kColors[index].value;
                  setState(() {});
                },
                child: ColorItem(isActive: currentIndex == index, color: kColors[index],)),
          );
        },
      ),
    );
  }
}
