import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/widgets/custom_pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SignDocument extends StatelessWidget {
  const SignDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hola Mundo'),
              // CustomPdfViewer(src: 'assets/pdf/Alex-AR-CV.pdf')
              CustomPdfViewer(
                  src:
                      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')
            ],
          ),
        ),
      ),
    );
  }
}
