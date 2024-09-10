import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';

class PDFSignaturePosition extends StatefulWidget {
  final Uint8List pdfBytes;
  final Uint8List signatureBytes;

  const PDFSignaturePosition(
      {super.key, required this.pdfBytes, required this.signatureBytes});

  @override
  PDFSignaturePositionState createState() => PDFSignaturePositionState();
}

class PDFSignaturePositionState extends State<PDFSignaturePosition> {
  Offset? _selectedPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Signature Position"),
      ),
      body: GestureDetector(
        onTapUp: (TapUpDetails details) {
          setState(() {
            _selectedPosition = details.localPosition;
          });
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                color: Colors.grey[300],
                width: 300,
                height: 400,
                child: const Center(
                  child: Text('Page Preview'),
                ),
              ),
            ),
            if (_selectedPosition != null)
              Positioned(
                left: _selectedPosition!.dx - 100,
                top: _selectedPosition!.dy - 50,
                child: Image.memory(
                  widget.signatureBytes,
                  width: 200,
                  height: 100,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedPosition != null) {
            Navigator.pop(context, _selectedPosition);
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  Future<void> createPDFWithUserSelectedSignature(
    Uint8List pdfBytes,
    Uint8List signatureBytes,
    Offset position,
  ) async {
    final pdf = pw.Document();
    final signatureImage = pw.MemoryImage(signatureBytes);

    // Convertir la posición en puntos de PDF (puede requerir ajuste según la resolución)
    final pdfPosition = PdfPoint(position.dx, 400 - position.dy);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Stack(
          children: [
            pw.Positioned(
              left: pdfPosition.x,
              bottom: pdfPosition.y,
              child: pw.Image(signatureImage, width: 200, height: 100),
            ),
            pw.Center(
              child: pw.Text('Page 1'),
            ),
          ],
        ),
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/user_signed_document.pdf");
    await file.writeAsBytes(await pdf.save());

    // print("PDF guardado en ${file.path}");
  }
}
