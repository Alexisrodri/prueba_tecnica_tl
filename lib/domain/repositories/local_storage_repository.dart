import 'package:prueba_tecnica_tl/models/document.dart';

abstract class LocalStorageRepository {
  Future<void> toogleDocument(Document doc);

  Future<bool> addDocument(String filename);

  Future<List<Document>> loadDocuments({int limit = 10, offset = 0});
}
