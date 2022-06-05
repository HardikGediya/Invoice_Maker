import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/models/invoice_models.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'Invoice Maker',
                        style: TextStyle(
                          color: dColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: lColor,
                    ),
                    (Pdf.isEmpty)
                        ? Expanded(
                            flex: 9,
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Image.asset(
                                    "assets/icons/box.png",
                                    height: 70,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "No Invoice + Create new invoice",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 4,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            flex: 9,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 100),
                              itemCount: Pdf.length,
                              itemBuilder: (context, i) {
                                return Card(
                                  elevation: 2,
                                  child: ListTile(
                                    onTap: () {
                                      setState(() async {
                                        final dir =
                                            await getApplicationDocumentsDirectory();
                                        final file =
                                            File('${dir.path}/${Pdf[i]}');
                                        final url = file.path;
                                        await OpenFile.open(url);
                                      });
                                    },
                                    title: Text('${Pdf[i]}.pdf'),
                                    leading: Image.asset(
                                      'assets/icons/pdf.png',
                                      scale: 15,
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: dColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Pdf.removeAt(i);
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('invoiceDetailsPage');
        },
        label: const Text('Add Invoice'),
        icon: const Icon(Icons.add),
        backgroundColor: dColor,
      ),
    );
  }
}
