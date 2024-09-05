import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/widgets/custom_item_bottom.dart';

import '../widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10, left: 10),
          child: const Labels(
            text: 'Dashboard',
            color: Color(0xFF919196),
            secondText: 'Bienvenido Paul',
            size: 26,
            weight: FontWeight.w500,
            secondColor: Colors.blueAccent,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          '¿Qué Quieres Hacer?',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const CustomItemBottom(
          title: 'Firmar Documentos',
          subtitle:
              'Firma documentos electrónicos y solicita la firma de terceros.',
          icon: Icons.document_scanner_outlined,
          secondIcon: Icons.chevron_right_rounded,
        ),
        const CustomItemBottom(
          title: 'Solicitudes de Acceso a Información',
          subtitle: 'Tienes 4 solicitudes de acceso a tu información personal.',
          icon: Icons.document_scanner_outlined,
          secondIcon: Icons.chevron_right_rounded,
        ),
        const CustomItemBottom(
          title: 'Gestionar mi información personal',
          subtitle:
              'Actualiza tu información, solicita acceso,rectificación, eliminación.',
          icon: Icons.document_scanner_outlined,
          secondIcon: Icons.chevron_right_rounded,
        ),
      ],
    );
  }
}
