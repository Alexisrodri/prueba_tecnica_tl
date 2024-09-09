import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/helper/helpers.dart';
import 'package:prueba_tecnica_tl/screens/provider/storage.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

final hasDocumentInDb =
    FutureProvider.family.autoDispose((ref, String filename) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return localStorageRepository.hasDocumentInDb();
});

class LoadDocuments extends ConsumerWidget {
  const LoadDocuments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasDocuments = ref.watch(hasDocumentInDb(''));
    return hasDocuments.when(
        loading: () => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
        error: (_, __) => throw Error(),
        data: (data) =>
            data ? const LocalDocuments() : const FilePickerDocuments());
  }
}

class LocalDocuments extends ConsumerStatefulWidget {
  const LocalDocuments({super.key});

  @override
  LocalDocumentsState createState() => LocalDocumentsState();
}

class LocalDocumentsState extends ConsumerState<LocalDocuments> {
  @override
  void initState() {
    super.initState();
    ref.read(documentInDb.notifier).loadDocumentsDb();
  }

  @override
  Widget build(BuildContext context) {
    final docsInDB = ref.watch(documentInDb).values.toList();
    return ListView.builder(
      itemCount: docsInDB.length,
      itemBuilder: (context, index) {
        return Container(
          width: 500,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text('Sube tus documentos y ordénalos'),
              SizedBox(
                height: MediaQuery.of(context).size.height - 500,
                child: CustomReordenableList(
                  items: docsInDB,
                  icon: Icons.abc_outlined,
                ),
              ),
              CustomButton(
                text: 'Cancelar',
                onPress: () {
                  context.go('/home');
                },
                isOutlined: true,
              ),
              CustomButton(
                text: 'Continuar',
                onPress: () {},
                isDisabled: docsInDB.isEmpty,
              ),
              const Text(
                'Prueba tecnica - Alex Avila',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FilePickerDocuments extends ConsumerWidget {
  const FilePickerDocuments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sube tus documentos y ordénalos'),
              SizedBox(width: 5),
              Icon(Icons.help, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final document = await pickDocument();
              if (document != null) {
                await ref.read(documentInDb.notifier).toggleDocument(document);
                ref.invalidate(hasDocumentInDb(''));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black, spreadRadius: 1)
                ],
              ),
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1,
              child: const Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload_file_outlined, size: 80),
                  SizedBox(height: 10),
                  Text('Subir documento', style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 5),
                  Text('PDF 20MB', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          CustomButton(
            text: 'Cancelar',
            onPress: () {
              context.go('/home');
            },
            isOutlined: true,
          ),
          CustomButton(
            text: 'Continuar',
            onPress: () {},
            isDisabled: true,
          ),
          const Spacer(),
          const Text('Prueba tecnica - Alex Avila',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
