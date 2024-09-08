import 'package:flutter/material.dart';
import '../../core/utils/styles.dart';
import 'notes_view_body_appbar.dart';

class CustomEditNotesViewAppbar extends StatelessWidget {
  const CustomEditNotesViewAppbar({Key? key, required this.title, required this.icon,required this.onPressed}) : super(key: key);
  final String title ;
  final Icon icon ;
  final Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 30),
      child: Row(
        children: [
           Text(
            title,
            style: Styles.textStyle18,
          ),
          const Spacer(),
          IconButton(
              onPressed: onPressed, icon: icon,
           ),
        ],
      ),
    );
  }
}