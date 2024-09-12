import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar customAppbar(BuildContext context) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    // shadowColor: Colors.transparent,
    flexibleSpace: Container(
        // decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xFFF5FAFA),
        //     Color(0xFFF5FAFA),
        //   ],
        // ),
        // ),
        ),
    title: const Image(
      image: AssetImage('assets/images/logo-tl.png'),
      fit: BoxFit.cover,
      height: 30,
    ),
    actions: [
      GestureDetector(
        onTap: () {
          context.push('/theme');
        },
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image(
              image: AssetImage('assets/images/avatar.png'),
              fit: BoxFit.cover,
              height: 30,
            ),
          ),
        ),
      ),
    ],
  );
}
