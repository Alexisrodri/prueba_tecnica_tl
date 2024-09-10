import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:prueba_tecnica_tl/screens/provider/providers.dart';
import 'package:prueba_tecnica_tl/widgets/customs/custom_appbar.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    // final docs = ref.watch(documentInDb);
    // debugPrint('docsProfile:::${docs.toString()}');
    return Scaffold(
        appBar: customAppbar(context),
        body: const Column(
          children: [
            Text('Perfil'),
            // PDFSignaturePosition(pdfBytes: , signatureBytes: signatureBytes)
          ],
        ));
  }
}
