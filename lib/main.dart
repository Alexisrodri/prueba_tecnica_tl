import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/widgets/pdf_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: PdfView(),
        home: SafeArea(
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
                  title: const Text('Logo'),
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
