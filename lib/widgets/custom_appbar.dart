import 'package:flutter/material.dart';

AppBar customAppbar() {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    shadowColor: Colors.transparent,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF5FAFA),
            Color(0xFFF5FAFA),
          ],
        ),
      ),
    ),
    title: const Image(
      image: AssetImage('assets/images/logo-tl.png'),
      fit: BoxFit.cover,
      height: 30,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          child: Text('AR'),
        ),
      ),
    ],
  );
}
