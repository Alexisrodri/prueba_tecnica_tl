import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

import '../screens.dart';

class SingDocumentScreen extends StatefulWidget {
  const SingDocumentScreen({super.key});

  @override
  State<SingDocumentScreen> createState() => _SingDocumentScreenState();
}

class _SingDocumentScreenState extends State<SingDocumentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      drawer: const Drawer(),
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
                  Color(0xE5FFFFFF),
                ],
              ),
            ),
          ),
          // TabBar(tabs:

          // )
        ],
      ),
    );
  }
}
