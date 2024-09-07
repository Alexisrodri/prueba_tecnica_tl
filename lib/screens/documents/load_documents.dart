import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

class LoadDocuments extends StatelessWidget {
  const LoadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
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
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom, allowedExtensions: ['pdf', ',p12']);
              if (result != null) {
                File file = File(result.files.single.path!);
                debugPrint('File-pdf:::$file');
              } else {
                debugPrint('User canceled the picker');
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
          // const Spacer(),
          const Text(
            'Prueba tecnica - Alex Avila',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
