import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/models/document.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';
import '../provider/providers.dart';

class BuildSignersTab extends ConsumerStatefulWidget {
  final TabController tabController;

  const BuildSignersTab({super.key, required this.tabController});

  @override
  BuildSignersTabState createState() => BuildSignersTabState();
}

class BuildSignersTabState extends ConsumerState<BuildSignersTab> {
  Document? _selectedDocument;
  String _password = '';

  bool get _isButtonEnabled {
    return _selectedDocument != null && _password.length > 3;
  }

  @override
  Widget build(BuildContext context) {
    final docsInDB = ref.watch(documentInDb).values.toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Tu Firma',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Firmante Registrado: Paúl Quiñonez',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'paul.quinonez@todolegal.com',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seleccionar certificado',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: DropdownButtonFormField<Document>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  alignLabelWithHint: true,
                ),
                items: docsInDB.map((Document doc) {
                  return DropdownMenuItem(
                    value: doc,
                    child: Text(doc.fileName),
                  );
                }).toList(),
                onChanged: (Document? doc) {
                  setState(() {
                    _selectedDocument = doc;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            CustomInput(
              label: 'Contraseña',
              isPassword: true,
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Cancelar',
              onPress: () {
                context.go('/home');
              },
              isOutlined: true,
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'Continuar',
              onPress: () {
                widget.tabController.animateTo(widget.tabController.index + 1);
              },
              isDisabled: !_isButtonEnabled,
            ),
            const SizedBox(height: 20),
            const Text(
              'Prueba tecnica - Alex Avila',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
