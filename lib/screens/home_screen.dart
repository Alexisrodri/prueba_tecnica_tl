import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        // Image.asset()
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xfff5fafa),
            Color(0xffebf0f5),
            Color(0xffebebf0),
          ], tileMode: TileMode.mirror)),
          child: Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
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
                )
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
