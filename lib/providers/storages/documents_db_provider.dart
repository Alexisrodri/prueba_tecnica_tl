import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/models/document.dart';
import 'package:prueba_tecnica_tl/providers/storages/local_storages.dart';
import 'package:prueba_tecnica_tl/repositories/local_storage_repository.dart';

final localDocumentsProvider =
    StateNotifierProvider<StorageDocumentNotifier, Map<int, Document>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageDocumentNotifier(
      localStorageRepository: localStorageRepository);
});

class StorageDocumentNotifier extends StateNotifier<Map<int, Document>> {
  final LocalStorageRepository localStorageRepository;

  StorageDocumentNotifier({required this.localStorageRepository}) : super({});

  Future<List<Document>> loadLocalDocuments() async {
    final documents = await localStorageRepository.loadDocuments();
    print('dbDocument:: $documents');
    final tempMoviesMap = <int, Document>{};
    for (final docs in documents) {
      tempMoviesMap[docs.isarId!] = docs;
    }

    state = {...state, ...tempMoviesMap};

    return documents;
  }

  Future<void> toggleFavorite(Document docs) async {
    await localStorageRepository.addDatabase(docs);
    final bool isDocumentAdd = state[docs.isarId] != null;

    if (isDocumentAdd) {
      state.remove(docs.isarId);
      state = {...state};
    } else {
      state = {...state, docs.isarId!: docs};
    }
  }
}
