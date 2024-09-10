import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';
import '../provider/providers.dart';

class PersonalizationDocument extends ConsumerWidget {
  final TabController tabController;

  const PersonalizationDocument({super.key, required this.tabController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtenemos el documento seleccionado desde el provider
    final selectedDocument = ref.watch(selectedDocumentProvider);

    // Obtenemos la contraseña desde el provider
    final password = ref.watch(passwordProvider);

    // Verificamos si hay un documento seleccionado antes de realizar la conversión
    if (selectedDocument == null) {
      return const Center(
        child: Text('No hay un documento seleccionado.'),
      );
    }

    // Convertimos los bytes de List<int> a Uint8List
    final Uint8List pdfBytes = Uint8List.fromList(selectedDocument.pdfBytes);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Labels(
              text: 'Posicionar las firmas',
              secondText:
                  'Seleccione el firmante y pincha en donde deseas que se estampen las firmas e iniciales',
              secondSize: 12,
              alignment: CrossAxisAlignment.center,
            ),
          ),
          CustomSelect(
            name: 'Paúl Quiñonez',
            onLeftArrowPressed: () {},
            onRightArrowPressed: () {},
          ),
          // Pasamos los bytes convertidos a Uint8List al CustomPdfViewer
          CustomPdfViewer(
            pdfbytes: pdfBytes,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: const Flex(direction: Axis.vertical, children: [
              Text(
                'Importante:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'El certificado de Firma Electrónica, solo se podrá posicionar una vez en el documento. Toma en cuenta que el certificado firma todo el documento y no sólo una hoja en particular.',
                style: TextStyle(fontSize: 12),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'Finalizar',
              onPress: () {
                tabController.animateTo(tabController.index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
