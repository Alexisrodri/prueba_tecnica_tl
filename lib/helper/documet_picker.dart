import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../models/document.dart';

Future<Document?> pickDocument(BuildContext context) async {
  const int fileSizeLimit = 2 * 1024 * 1024; // 2 MB en bytes

  try {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'p12'],
        compressionQuality: fileSizeLimit);

    if (result != null && result.files.isNotEmpty) {
      final filePath = result.files.single.path;
      final fileName = result.files.single.name;

      if (filePath != null) {
        final file = File(filePath);
        final fileContent = await file.readAsBytes();

        if (fileContent.length > fileSizeLimit) {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: const Text('Archivo demasiado grande'),
          //       content: const Text(
          //           'El archivo seleccionado excede el tamaño máximo permitido de 2 MB.'),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           child: const Text('Aceptar'),
          //         ),
          //       ],
          //     );
          //   },
          // );
          return null;
        }

        final document = Document(
          fileName: fileName,
          pdfBytes: fileContent.toList(),
        )
          ..fileName = fileName
          ..pdfBytes = fileContent
          ..pdfBytes = fileContent.toList()
          ..createdAt = DateTime.now();
        return document;
      }
    }
  } catch (e) {
    debugPrint('Error al seleccionar o leer el archivo: $e');
  }

  return null;
}
