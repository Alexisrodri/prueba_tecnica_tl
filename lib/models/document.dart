import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
part 'document.g.dart';

@collection
class Document {
  Id? isarId = Isar.autoIncrement;
  late String uuid;
  late String fileName;
  late List<int> pdfBytes;
  late DateTime createdAt;

  Document({
    required this.fileName,
    required this.pdfBytes,
  }) : uuid = const Uuid().v4();
}
