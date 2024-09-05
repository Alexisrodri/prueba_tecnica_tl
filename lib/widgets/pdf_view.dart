import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  const PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  late PdfViewerController _controller;

  @override
  void initState() {
    _controller = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PdfViewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.first_page,
                color: Colors.white,
              ),
              onPressed: () {
                _controller.firstPage();
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.last_page,
                color: Colors.white,
              ),
              onPressed: () {
                _controller.nextPage();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SfPdfViewer.network(
            'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
            scrollDirection: PdfScrollDirection.horizontal,
            enableDoubleTapZooming: true,
            controller: _controller,
          ),
        ));
  }
}
