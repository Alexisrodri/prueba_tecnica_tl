import 'package:isar/isar.dart';
import 'package:prueba_tecnica_tl/domain/domain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prueba_tecnica_tl/models/document.dart';

class IsarDatasource extends LocalStorageDatasource {
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
  Future<bool> addDocument(String filename) async {
    final isar = await db;
    final existingDocument =
        await isar.documents.where().fileNameEqualTo(filename).findFirst();
    if (existingDocument != null) {
      return false;
    }
    return true;
    // isar.writeTxnSync(() => isar.documents.putSync());
  }

  @override
  Future<List<Document>> loadDocuments({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.documents.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toogleDocument(Document doc) async {
    final isar = await db;
    final documentInDb =
        await isar.documents.where().fileNameEqualTo(doc.fileName).findFirst();
    if (documentInDb != null) {
      isar.writeTxnSync(() => isar.documents.deleteSync(doc.isarId!));
    }
    isar.writeTxnSync(() => isar.documents.putSync(doc));
  }
}
