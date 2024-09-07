import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/infrastructure/datasources/isar_datasource_impl.dart';
import 'package:prueba_tecnica_tl/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
