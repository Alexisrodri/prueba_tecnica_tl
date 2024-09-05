import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final String? secondText;
  final double? secondSize;
  final Color? secondColor;
  final FontWeight? secondWeight;
  final String route;

  const Labels(
      {super.key,
      required this.text,
      this.size = 15,
      this.color = Colors.black,
      this.weight = FontWeight.normal,
      this.secondText,
      this.secondSize = 15,
      this.secondColor = Colors.black,
      this.secondWeight = FontWeight.normal,
      this.route = ''});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
        ),
        Text(
          secondText!,
          style: TextStyle(
            color: secondColor,
            fontSize: secondSize,
            fontWeight: secondWeight,
          ),
        ),
      ],
    );
  }
}
