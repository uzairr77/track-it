import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:printing/printing.dart';

class PrintedFormScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String address;
  final String applicationTo;
  final String applicationContent;
  final String barcodeSvg;
  final String barcodeData;

  const PrintedFormScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.applicationTo,
    required this.applicationContent,
    required this.barcodeSvg,
    required this.barcodeData,
  }) : super(key: key);

  Future<Uint8List> saveAsPdf(BuildContext context) async {
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Stack(
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    pw.Text('First Name: ', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(width: 5),
                    pw.Text(firstName, style: pw.TextStyle(fontSize: 18)),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text('Last Name: ', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(width: 5),
                    pw.Text(lastName, style: pw.TextStyle(fontSize: 18)),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text('Address: ', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(width: 5),
                    pw.Text(address, style: pw.TextStyle(fontSize: 18)),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text('Application To: ', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(width: 5),
                    pw.Text(applicationTo, style: pw.TextStyle(fontSize: 18)),
                  ],
                ),
                pw.SizedBox(height: 12),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Application Content: ',
                      style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.SizedBox(height: 6),
                pw.Row(
                  children: [
                    pw.Text(applicationContent, style: pw.TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
            pw.Positioned(
              top: 1, // Adjust the top position as needed
              right: 3, // Adjust the right position as needed
              child: pw.BarcodeWidget(
                data: barcodeData,
                barcode: pw.Barcode.code128(),
                width: 120,
                height: 45,
                color: PdfColor(0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );

    return await pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text('Printed Application Form'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: PdfPreview(
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        maxPageWidth: MediaQuery.of(context).size.width * 0.7,
        build: (format) => saveAsPdf(context),
      ),
    );
  }
}
