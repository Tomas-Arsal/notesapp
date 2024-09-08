import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/utils/styles.dart';


class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({Key? key, this.onTap, required this.isLoading})
      : super(key: key);
  final void Function()? onTap;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(500),
                shape: BoxShape.rectangle),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      height: 28,
                      width: 28,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                  : const Text(
                      'add',
                      style: Styles.textStyle20,
                    ),
            )),
      ),
    );
  }
}
