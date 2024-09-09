import 'dart:io';
import 'package:file_picker/file_picker.dart';

import '../models/document.dart';

Future<Document?> pickDocument() async {
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

  return null;
}
