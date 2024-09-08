import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);
  final bool isActive;
 final Color color ;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: color,
            ),
    )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}
