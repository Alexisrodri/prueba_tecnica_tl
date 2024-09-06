import 'package:isar/isar.dart';
part 'document.g.dart';

@collection
class Document {
  Id isarId = Isar.autoIncrement;
  late String fileName;
  late List<int> fileContent;
  late DateTime createdAt;
}
