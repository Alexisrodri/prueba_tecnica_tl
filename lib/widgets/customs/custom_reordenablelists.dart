import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/helper/helpers.dart';
import 'package:prueba_tecnica_tl/models/document.dart';
import '../../screens/provider/providers.dart';
import '../../screens/screens.dart';

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
  Document? _selectedDocument;

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
      onReorder: (oldIndex, newIndex) {
        if (_items.length > 1 && newIndex < _items.length - 1) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = _items.removeAt(oldIndex);
          setState(() {
            _items.insert(newIndex, item);
          });
        }
      },
      children: [
        ..._items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final bool isFirst = index == 0;
          final bool isSelected = item == _selectedDocument;
          return Container(
            key: ValueKey(item.isarId),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: isFirst ? Colors.red : Colors.blueAccent,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
            ),
            child: ListTile(
              onTap: () {
                if (isFirst) {
                  setState(() {
                    _selectedDocument = item;
                    ref.read(selectedDocumentProvider.notifier).state = item;
                  });
                }
              },
              leading: Icon(
                Icons.drag_indicator,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                truncateFileName(item.fileName),
                style: const TextStyle(color: Colors.black54),
              ),
              subtitle: Text(formatDate(item.createdAt.toString()),
                  style: const TextStyle(color: Colors.black54)),
              trailing: IconButton(
                  onPressed: () async {
                    final index = _items.indexOf(item);
                    if (index != -1) {
                      setState(() {
                        _items.removeAt(index);
                        _documentIds.remove(item.fileName);
                      });
                      await ref
                          .read(documentInDb.notifier)
                          .toggleDocument(item);
                      ref.invalidate(documentInDb);
                    }
                  },
                  icon: const Icon(Icons.delete_outline)),
            ),
          );
        }),
        Container(
          key: UniqueKey(),
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
              final document = await pickDocument(context, ['pdf']);
              if (document != null &&
                  !_documentIds.contains(document.fileName)) {
                setState(() {
                  _items.add(document);
                  _documentIds.add(document.fileName);
                });
                await ref.read(documentInDb.notifier).toggleDocument(document);
                ref.invalidate(hasDocumentInDb(''));
              }
            },
            leading: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Añadir más documentos',
              style: TextStyle(color: Theme.of(context).primaryColor),
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
}
