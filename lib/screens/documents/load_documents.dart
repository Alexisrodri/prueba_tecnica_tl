import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';
import '../../models/document.dart';

class LoadDocuments extends ConsumerWidget {
  const LoadDocuments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const FilePickerDocuments();
  }
}

class LocalDocuments extends ConsumerStatefulWidget {
  const LocalDocuments({super.key});

  @override
  LocalDocumentsState createState() => LocalDocumentsState();
}

class LocalDocumentsState extends ConsumerState<LocalDocuments> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text('title'),
          subtitle: Text('subtitle'),
        );
      },
    );
  }
}

class FilePickerDocuments extends ConsumerWidget {
  const FilePickerDocuments({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final refdoc = ref.watch(localDocumentsProvider.notifier);
    // print('Archivos:::$refdoc');
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sube tus documentos y ordénalos'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.help,
                color: Colors.black54,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              // await
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'p12'],
              );

              if (result != null) {
                final filePath = result.files.single.path;
                final fileName = result.files.single.name;

                if (filePath != null) {
                  final file = File(filePath);
                  final fileContent = await file.readAsBytes();

                  final document = Document(
                      fileName: fileName, pdfBytes: fileContent.toList())
                    ..fileName = fileName
                    ..pdfBytes = fileContent.toList()
                    ..createdAt = DateTime.now();
                  print('document:: ${document.uuid}');
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black, spreadRadius: 1),
                ],
              ),
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1,
              child: const Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload_file_outlined,
                    size: 80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Subir documento',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'PDF 20MB',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          CustomButton(
            text: 'Cancelar',
            onPress: () {
              context.go('/home');
            },
            isOutlined: true,
          ),
          CustomButton(
            text: 'Continuar',
            onPress: () {},
            isDisabled: true,
          ),
          const Spacer(),
          const Text(
            'Prueba tecnica - Alex Avila',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
