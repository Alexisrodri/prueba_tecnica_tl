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
  final CrossAxisAlignment? alignment;

  const Labels({
    super.key,
    required this.text,
    this.size = 25,
    this.color = Colors.blue,
    this.weight = FontWeight.w500,
    this.secondText,
    this.secondSize = 15,
    this.secondColor = Colors.black54,
    this.secondWeight = FontWeight.normal,
    this.route = '',
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment!,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
        ),
        if (secondText != null)
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
