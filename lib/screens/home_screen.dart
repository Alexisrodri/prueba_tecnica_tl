import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/screens/screens.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width / 5);
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
            Positioned(
              bottom: 50,
              left: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                'assets/images/fondo.png',
                width: 250,
              ),
            ),
            const Positioned(
              bottom: 20,
              // right: 20,
              left: 80,
              // width: double.infinity,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Prueba de desarrollo:'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Alex Avila',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
