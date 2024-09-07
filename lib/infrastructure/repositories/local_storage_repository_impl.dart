import 'package:prueba_tecnica_tl/datasources/local_datasources.dart';
import 'package:prueba_tecnica_tl/models/document.dart';
import 'package:prueba_tecnica_tl/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasources datasources;

  LocalStorageRepositoryImpl(this.datasources);

  @override
  Future<void> addDatabase(Document document) {
    return datasources.addDatabase(document);
  }

  @override
  Future<List<Document>> loadDocuments(Document document) {
    return loadDocuments(document);
  }
}
