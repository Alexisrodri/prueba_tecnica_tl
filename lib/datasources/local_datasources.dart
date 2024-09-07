import 'package:prueba_tecnica_tl/models/document.dart';

abstract class LocalStorageDatasources {
  Future<void> addDatabase(Document document);

  Future<List<Document>> loadDocuments({int limit, offset});
}
