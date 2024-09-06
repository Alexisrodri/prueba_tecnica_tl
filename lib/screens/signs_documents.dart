import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

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
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      drawer: const Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_outlined),
                  iconSize: 30,
                  onPressed: () => context.pop(),
                ),
                const Text(
                  'Firmar Documentos',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.blue,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              tabs: const [
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.document_scanner_outlined),
                      Text('Cargar documentos')
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.people_outline_sharp),
                      Text('Indicar firmantes'),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.bookmark_add_outlined),
                      Text('Personalizaciones'),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.text_snippet_outlined),
                      Text('Resumen'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LoadDocuments(),
                BuildSignersTab(),
                Center(child: Text('Personalizaciones')),
                Center(child: Text('Resumen')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
