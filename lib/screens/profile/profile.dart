import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/widgets/customs/custom_appbar.dart';

import '../../providers/storages/documents_db_provider.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends ConsumerState<Profile> {
  @override
  void initState() {
    ref.read(localDocumentsProvider.notifier).loadLocalDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final docs = ref.watch(localDocumentsProvider).values.toList();
    debugPrint(docs.toString());
    return Scaffold(
      appBar: customAppbar(context),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (context, index) {
          final documents = docs[index];
          return ListTile(
            title: Text(documents.fileName),
            subtitle: const Text('Hola'),
          );
        },
      ),
    );
  }
}
