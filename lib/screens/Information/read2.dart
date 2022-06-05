import 'package:flutter/material.dart';
import 'package:invoice_app/models/invoice_models.dart';

class Read2 extends StatefulWidget {
  const Read2({Key? key}) : super(key: key);

  @override
  _Read2State createState() => _Read2State();
}

class _Read2State extends State<Read2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 30, right: 30),
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
            padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
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
            padding: const EdgeInsets.only(top: 70),
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
                padding: const EdgeInsets.all(35.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 80),
                        Text(
                          'Fast and Professional Online Invoice Maker',
                          style: TextStyle(
                            fontSize: 30,
                            color: dColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          'Wix Invoice Generator lets you create custom invoices for your business—free. Enter your contact info, add client details and describe your billing items. When you’re done, send your invoice directly to clients** or download a PDF copy from your email.',
                          style: TextStyle(
                            fontSize: 20,
                            color: dColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:  GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/');
        },
        child: Container(
          decoration: BoxDecoration(
            color: dColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          height: 50,
          width: 200,
          alignment: Alignment.center,
          child: const Text(
            'Create Your Invoice',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
