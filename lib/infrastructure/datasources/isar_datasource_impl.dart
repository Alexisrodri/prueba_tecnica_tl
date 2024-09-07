import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prueba_tecnica_tl/datasources/local_datasources.dart';
import 'package:prueba_tecnica_tl/models/document.dart';

class IsarDatasource extends LocalStorageDatasources {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([DocumentSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> addDatabase(Document document) async {
    final isar = await db;
    final documentAdd = await isar.documents
        .filter()
        .isarIdEqualTo(document.isarId!)
        .findFirst();
    if (documentAdd != null) {
      isar.writeTxnSync(() => isar.documents.deleteSync(document.isarId!));
      return;
    }
    isar.writeTxnSync(() => isar.documents.putSync(document));
  }

  @override
  Future<List<Document>> loadDocuments({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.documents.where().offset(offset).limit(limit).findAll();
  }

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

          await addDatabase(document);
        }
      } else {
        print("No file selected");
      }
    } catch (e) {
      print("Error picking or saving file: $e");
    }
  }
}
