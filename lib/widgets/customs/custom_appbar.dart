import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar customAppbar(BuildContext context) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    // backgroundColor: Theme.of(context).primaryColor,
    flexibleSpace: Container(),
    title: const Image(
      image: AssetImage('assets/images/logo-tl.png'),
      fit: BoxFit.cover,
      height: 30,
    ),
    actions: [
      GestureDetector(
        onTap: () {
          context.push('/profile');
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
