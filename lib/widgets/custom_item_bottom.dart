// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomItemBottom extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData secondIcon;

  const CustomItemBottom(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.secondIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          width: 0.2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: ListTile(
        dense: true,
        minLeadingWidth: 10,
        titleAlignment: ListTileTitleAlignment.top,
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            // fontSize: 1,
            color: Color(0xFF6C7178),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(secondIcon),
      ),
    );
  }
}
