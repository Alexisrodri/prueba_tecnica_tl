import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SignDocument extends StatelessWidget {
  const SignDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hola Mundo'),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: SfPdfViewer.asset(
                  'assets/pdf/Alex-AR-CV.pdf',
                  canShowScrollHead: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
