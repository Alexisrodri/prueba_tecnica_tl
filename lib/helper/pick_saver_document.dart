import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../models/document.dart';

Future<void> pickAndSaveDocument() async {
  try {
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

        final document = Document()
          ..fileName = fileName
          ..fileContent = fileContent
          ..createdAt = DateTime.now();

        (document);
      }
    } else {
      print("No file selected");
    }
  } catch (e) {
    print("Error picking or saving file: $e");
  }
}
