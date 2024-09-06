import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';

import '../models/document.dart';

Future<void> pickAndSaveDocument(Isar isar) async {
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

        await isar.writeTxn(() async {
          if (Isar.instanceNames.isEmpty) {
            await Isar.open([DocumentSchema], directory: '');
            await isar.documents.put(document);
          }
        });
      }
    } else {
      print("No file selected");
    }
  } catch (e) {
    print("Error picking or saving file: $e");
  }
}
