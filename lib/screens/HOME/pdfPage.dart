import 'dart:io';
import 'dart:ui';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:invoice_app/models/invoice_models.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  TextStyle _MaintextStyle = TextStyle(
    color: Colors.indigo,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  TextStyle _SubtextStyle = TextStyle(
    color: Colors.deepPurple,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  TextStyle _textStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 40, right: 40),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.blueGrey.shade100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 15, right: 15),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.blueGrey.shade200,
              ),
            ),
          ),

          //00416A
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(27),
                  topLeft: Radius.circular(27),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  'invoiceDetailsPage', (route) => false);
                            },
                            icon: const Icon(Icons.arrow_back_ios_rounded),
                          ),
                          Text(
                            'Invoice Pdf',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: dColor,
                              fontSize: 23,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              setState(() {
                                Pdf.add("${invoice.invoiceNumber}");
                              });
                              final pdffile = await creareHelloworld
                                  .generateCenteredText("Sample Text");
                              creareHelloworld.openFile(pdffile);
                            },
                            icon: const Icon(Icons.download),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            headLines(number: '01', title: 'Business Info'),
                            CircleAvatar(
                              backgroundImage: FileImage(invoice.image),
                              radius: 60,
                            ),
                            textText(
                                subtitle: 'Business Name',
                                title: '${invoice.businessName}'),
                            textText(
                                subtitle: 'Business Email',
                                title: '${invoice.businessName}'),
                            textText(
                                subtitle: 'Business Address',
                                title: '${invoice.businessAddress}'),
                            textText(
                                subtitle: 'Country',
                                title: '${invoice.businessCountry}'),
                            const SizedBox(height: 30),
                            headLines(number: '02', title: 'Client Info'),
                            textText(
                                subtitle: "Client's Name",
                                title: '${invoice.clientName}'),
                            textText(
                                subtitle: "Client's Email",
                                title: '${invoice.clientEmail}'),
                            textText(
                                subtitle: "Client's Address",
                                title: '${invoice.clientAddress}'),
                            textText(
                                subtitle: "Country",
                                title: '${invoice.clientCountry}'),
                            const SizedBox(height: 30),
                            headLines(number: '03', title: 'Invoice Settings'),
                            textText(
                                subtitle: "Invoice number",
                                title: '${invoice.invoiceNumber}'),
                            textText(
                                subtitle: "Date of Issue",
                                title: '${invoice.dateOfIssue}'),
                            textText(
                                subtitle: "Due Date",
                                title: '${invoice.dueDate}'),
                            textText(
                                subtitle: "Currency",
                                title: '${invoice.currency}'),
                            textText(
                                subtitle: "Tax Type",
                                title: '${invoice.taxType}'),
                            textText(
                                subtitle: "Tax Rate %",
                                title: '${invoice.taxRate}'),
                            const SizedBox(height: 30),
                            headLines(number: '04', title: 'Billing Items'),
                            textText(
                                subtitle: "Product Name",
                                title: '${invoice.productName}'),
                            textText(
                                subtitle: "Product Description",
                                title: '${invoice.productDescription}'),
                            textText(
                                subtitle: "Product Price",
                                title: '${invoice.productPrice}'),
                            textText(
                                subtitle: "Product Quantity",
                                title: '${invoice.productQuantity}'),
                            textText(
                                subtitle: "Product Discount",
                                title: '${invoice.productDiscount}'),
                            const SizedBox(height: 30),
                            textText(
                                subtitle: "Subtotal",
                                title: '${invoice.subTotal}'),
                            textText(
                                subtitle: "Discount",
                                title: '${invoice.discount}'),
                            textText(subtitle: "Tax", title: '${invoice.tax}'),
                            textText(
                                subtitle: "Balance",
                                title: '${invoice.balance}'),
                            Container(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headLines({required String number, required String title}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              number,
              style: TextStyle(
                color: dColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 25,
              width: 3,
              color: Colors.purple,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: dColor,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget textText({required String subtitle, required String title}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    '$subtitle :  ',
                    style: _SubtextStyle,
                  ),
                  Flexible(
                    child: Text(
                      title,
                      style: _textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.indigo),
        ],
      ),
    );
  }
}

pw.TextStyle boldText = pw.TextStyle(
  color: PdfColors.black,
  fontWeight: pw.FontWeight.bold,
  fontSize: 14,
);

pw.TextStyle simpleText = const pw.TextStyle(
  color: PdfColors.black,
  fontSize: 14,
);

class creareHelloworld {
  static Future<File> generateCenteredText(String text) async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(
      File(invoice.image.path).readAsBytesSync(),
    );
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('From :', style: boldText),
                      pw.SizedBox(height: 10),
                      pw.Text('${invoice.businessName}', style: simpleText),
                      pw.Container(
                        width: 200,
                        child: pw.Text('${invoice.businessAddress}', style: simpleText),
                      ),
                      pw.Text('${invoice.businessCountry},', style: simpleText),
                      pw.Text('${invoice.businessEmail},', style: simpleText),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 60,
                        width: 60,
                        color: PdfColors.black,
                        child: pw.Image(image, fit: pw.BoxFit.cover),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            invoice.businessName!.split(' ')[0],
                            style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          pw.Text(
                            '${invoice.businessName}',
                            style: const pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 25),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('To :', style: boldText),
                      pw.SizedBox(height: 10),
                      pw.Text('${invoice.clientName}', style: simpleText),
                      pw.Container(
                        width: 200,
                        child: pw.Text('${invoice.clientAddress}', style: simpleText),
                      ),
                      pw.Text('${invoice.clientCountry}', style: simpleText),
                      pw.Text('${invoice.clientEmail}', style: simpleText),
                    ],
                  ),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Invoice # :', style: boldText),
                          pw.Text('Date of Issue :', style: boldText),
                          pw.Text('Due Date :', style: boldText),
                          pw.Text('Balance :', style: boldText),
                          pw.Text('Currency :', style: boldText),
                        ],
                      ),
                      pw.SizedBox(width: 20),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('${invoice.invoiceNumber}', style: simpleText),
                          pw.Text('${invoice.dateOfIssue}', style: simpleText),
                          pw.Text('${invoice.dueDate}', style: simpleText),
                          pw.Text('${invoice.balance}', style: simpleText),
                          pw.Text('${invoice.currency}', style: simpleText),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 50),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Container(
                    width: 110,
                    child: pw.Text('Product/Service', style: boldText),
                  ),
                  pw.Container(
                    width: 100,
                    child: pw.Text('Description', style: boldText),
                  ),
                  pw.Container(
                    width: 50,
                    child: pw.Text('Price', style: boldText),
                  ),
                  pw.Container(
                    width: 50,
                    child: pw.Text('QTY', style: boldText),
                  ),
                  pw.Container(
                    width: 70,
                    child: pw.Text('Discount', style: boldText),
                  ),
                  pw.Container(
                    width: 70,
                    child: pw.Text('Total', style: boldText),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 2,
                color: PdfColors.black,
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Container(
                    width: 110,
                    child: pw.Text('${invoice.productName}',
                        style: simpleText),
                  ),
                  pw.Container(
                    width: 100,
                    child: pw.Text('${invoice.productDescription}', style: simpleText),
                  ),
                  pw.Container(
                    width: 50,
                    child: pw.Text('${invoice.productPrice}', style: simpleText),
                  ),
                  pw.Container(
                    width: 50,
                    child: pw.Text('${invoice.productQuantity}', style: simpleText),
                  ),
                  pw.Container(
                    width: 70,
                    child: pw.Text('${invoice.productDiscount}', style: simpleText),
                  ),
                  pw.Container(
                    width: 70,
                    child: pw.Text('${invoice.productLineTotal}', style: simpleText),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 1,
                color: PdfColors.grey,
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Container(),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Subtotal :', style: boldText),
                          pw.Text('Discount :', style: boldText),
                          pw.Text('Tax :', style: boldText),
                          pw.Text('Additional tax :', style: boldText),
                        ],
                      ),
                      pw.SizedBox(width: 20),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('${invoice.subTotal}', style: simpleText),
                          pw.Text('${invoice.discount}', style: simpleText),
                          pw.Text('${invoice.tax}', style: simpleText),
                          pw.Text('${invoice.tax}', style: simpleText),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 1,
                color: PdfColors.black,
                indent: 300,
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(width: 310),
                      pw.Text('Balance :', style: boldText),
                      pw.SizedBox(width: 58),
                      pw.Text('${invoice.balance}', style: simpleText),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 50),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  'Thanks ${invoice.clientName} for you order!',
                  style: const pw.TextStyle(
                    fontSize: 19,
                    color: PdfColors.black,
                  ),
                ),
              ),

              pw.SizedBox(height: 44),

              pw.Divider(
                thickness: 1,
                color: PdfColors.black,
              ),

              pw.SizedBox(height: 5),

              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      'This invoice was generated with ',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.black,
                      ),
                    ),
                    pw.Text(
                      'Invoice Maker App',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.deepPurple,
                        decoration: pw.TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          );
        },
      ),
    );
    return saveDocument(name: "${invoice.invoiceNumber}", pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
