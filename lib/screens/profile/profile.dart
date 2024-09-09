import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/widgets/customs/custom_appbar.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    // final docs = ref.watch(localDocumentsProvider).values.toList();
    // debugPrint('docsProfile:::${docs.toString()}');
    return Scaffold(
      appBar: customAppbar(context),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          // final documents = docs[index];
          return const ListTile(
            title: Text('..'),
            subtitle: Text('Hola'),
          );
        },
      ),
    );
  }
}
