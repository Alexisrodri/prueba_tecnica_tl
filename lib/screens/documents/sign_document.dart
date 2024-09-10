import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/models/document.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

import '../provider/storage.dart';

class BuildSignersTab extends ConsumerWidget {
  final TabController tabController;

  const BuildSignersTab({super.key, required this.tabController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  color: Colors.blue),
            ),
            const SizedBox(height: 8),
            const Text(
              'Firmante Registrado: Paúl Quiñonez',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'paul.quinonez@todolegal.com',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seleccionar certificado',
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: DropdownButtonFormField<Document>(
                decoration: const InputDecoration(
                  // labelText: 'Seleccionar certificado',
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
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: 20),
            const CustomInput(
              label: 'Contraseña',
              type: TextInputType.name,
              icon: Icons.visibility_off,
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
                tabController.animateTo(tabController.index + 1);
              },
              isDisabled: false,
            ),
            const SizedBox(height: 20),
            const Text(
              'Prueba tecnica - Alex Avila',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
