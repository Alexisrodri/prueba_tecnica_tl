// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData secondIcon;
  final void Function()? onPress;

  const CustomListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.secondIcon,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          width: 0.4,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Icon(
          secondIcon,
          color: Colors.blue,
        ),
        onTap: onPress,
      ),
    );
  }
}
