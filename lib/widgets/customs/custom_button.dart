import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback press;

  const CustomButton({super.key, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 16);
    return SizedBox(
      width: double.infinity,
      child: Platform.isIOS
          ? CupertinoButton(
              padding: verticalPadding,
              color: const Color(0xFF22A45D),
              onPressed: press,
              child: Text(text),
            )
          : ElevatedButton(
              style: TextButton.styleFrom(
                padding: verticalPadding,
                backgroundColor: const Color(0xFF22A45D),
                elevation: 0,
                side: const BorderSide(width: 0, color: Colors.white),
              ),
              onPressed: press,
              child: Text(text),
            ),
    );
  }

  // Text buildText(BuildContext context) {
  //   return Text(
  //     text.toUpperCase(),
  //     style: const TextStyle(
  //       color: Colors.white,
  //       fontSize: 14,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   );
  // }
}
