import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<void> addSignatureToPdf(
    Uint8List pdfBytes, Uint8List signatureBytes) async {
  try {
    final PdfDocument document = PdfDocument(inputBytes: pdfBytes);

    final PdfPage page = document.pages[0];

    final PdfBitmap signatureImage = PdfBitmap(signatureBytes);

    const double x = 400;
    const double y = 700;
    const double width = 100;
    const double height = 50;

    page.graphics
        .drawImage(signatureImage, const Rect.fromLTWH(x, y, width, height));

    final directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/signed_document.pdf';
    final File file = File(filePath);

    final List<int> pdfBytesWithSignature = await document.save();
    await file.writeAsBytes(pdfBytesWithSignature);

    document.dispose();

    debugPrint('Documento guardado correctamente con la firma en $filePath');
  } catch (e) {
    debugPrint('Error al agregar la firma: $e');
  }
}
