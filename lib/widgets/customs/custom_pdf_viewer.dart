import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomPdfViewer extends StatefulWidget {
  final Uint8List pdfbytes;
  final String password;

  const CustomPdfViewer(
      {super.key, required this.pdfbytes, required this.password});

  @override
  State<CustomPdfViewer> createState() => _CustomPdfViewerState();
}

class _CustomPdfViewerState extends State<CustomPdfViewer> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  int _currentPage = 1;
  int _totalPages = 0;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _validatePdfBytes();
  }

  void _validatePdfBytes() {
    if (widget.pdfbytes.isEmpty) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _hasError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.87,
          maxHeight: MediaQuery.of(context).size.height * 0.554,
        ),
        child: Stack(
          children: [
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (_hasError)
              const Center(
                child: Text(
                  'Error al cargar el archivo PDF.',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            if (!_isLoading && !_hasError)
              SfPdfViewer.memory(
                widget.pdfbytes,
                controller: _pdfViewerController,
                password: widget.password,
                initialPageNumber: 1,
                pageLayoutMode: PdfPageLayoutMode.single,
                canShowPaginationDialog: false,
                canShowScrollHead: false,
                onDocumentLoaded: (details) {
                  setState(() {
                    _totalPages = details.document.pages.count;
                    _pdfViewerController.jumpToPage(1);
                  });
                },
                onPageChanged: (details) {
                  setState(() {
                    _currentPage = details.newPageNumber;
                  });
                },
              ),
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Documento Firmado\n',
                        style: TextStyle(
                          fontSize: 12,
                          // color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Electrónicamente por\n',
                        style: TextStyle(
                          fontSize: 12,
                          // color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: 'Paul Quiñonez',
                        style: TextStyle(
                          fontSize: 12,
                          // color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Alinear el texto a la derecha
                ),
              ),
            ),
            if (_totalPages > 0 && _currentPage > 0)
              Positioned(
                bottom: 20,
                left: MediaQuery.of(context).size.width * 0.5 - 50,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$_currentPage/$_totalPages',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
