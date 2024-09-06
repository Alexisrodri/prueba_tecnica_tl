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
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                'assets/images/fondo.png',
                width: 250,
                colorBlendMode: BlendMode.hue,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF5FAFA),
                    Color(0xFFF5FAFA),
                    Color(0xE5FFFFFF),
                  ],
                ),
              ),
              child: const DashboardScreen(),
            ),
            const Positioned(
              bottom: 20,
              // right: 20,
              left: 80,
              // width: double.infinity,
              child: Text(
                'Smart Contracts Suite - Un producto de Todolegal SAS - 2023',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
