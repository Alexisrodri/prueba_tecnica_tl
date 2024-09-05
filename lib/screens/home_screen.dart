import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/screens/screens.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const Drawer(),
        appBar: customAppbar(),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF5FAFA),
                    Color(0xFFF5FAFA),
                    Color(0xffebebf0),
                  ],
                ),
              ),
              child: const DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
