import 'package:prueba_tecnica_tl/models/document.dart';

abstract class LocalStorageRepository {
  Future<bool> hasDocuments();

  Future<void> addDatabase(Document document);

  Future<List<Document>> loadDocuments({int limit = 10, offset});
}
