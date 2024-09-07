import 'package:prueba_tecnica_tl/models/document.dart';

abstract class LocalStorageRepository {
  Future<void> addDatabase(Document document);

  Future<List<Document>> loadDocuments(Document document);
}
