import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/helper/helpers.dart';
import 'package:prueba_tecnica_tl/models/document.dart';

import '../../screens/provider/storage.dart';
import '../widgets.dart';

class CustomReordenableList extends ConsumerStatefulWidget {
  final List<Document> items;
  final IconData icon;

  const CustomReordenableList({
    super.key,
    required this.items,
    required this.icon,
  });

  @override
  CustomReordenableListState createState() => CustomReordenableListState();
}

class CustomReordenableListState extends ConsumerState<CustomReordenableList> {
  late List<Document> _items;
  late Set<String> _documentIds;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _documentIds = _items.map((item) => item.fileName).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      proxyDecorator: (child, index, animation) {
        return Material(
          color: Colors.transparent,
          borderOnForeground: false,
          shadowColor: Colors.transparent,
          elevation: 4,
          child: child,
        );
      },
      onReorder: _onReorder,
      children: [
        ..._items.map((item) {
          return Container(
            key: ValueKey(item.isarId),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.drag_indicator,
                color: Colors.blue,
              ),
              title: Text(
                truncateFileName(item.fileName),
                style: const TextStyle(color: Colors.black54),
              ),
              subtitle: Text(formatDate(item.createdAt.toString()),
                  style: const TextStyle(color: Colors.black54)),
              trailing: IconButton(
                  onPressed: () async {
                    debugPrint('delete');
                    await ref.read(documentInDb.notifier).toggleDocument(item);
                    ref.invalidate(documentInDb);
                  },
                  icon: const Icon(Icons.delete_outline)),
            ),
          );
        }),
        Container(
          key: UniqueKey(), // Use UniqueKey to ensure correct behavior
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
              width: 0.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: () async {
              final document = await pickDocument(context);
              if (document != null && !_documentIds.contains(document.isarId)) {
                setState(() {
                  _items.add(document);
                  _documentIds.add(document.fileName);
                });
                await ref.read(documentInDb.notifier).toggleDocument(document);
                ref.invalidate(hasDocumentInDb(''));
              }
            },
            leading: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
            title: const Text(
              'Añadir más documentos',
              style: TextStyle(color: Colors.blue),
            ),
            trailing: const Text(
              'Máx. 2 MB',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }
}
