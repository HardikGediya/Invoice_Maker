import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_app/models/invoice_models.dart';

class InvoiceDetailsPage extends StatefulWidget {
  const InvoiceDetailsPage({Key? key}) : super(key: key);

  @override
  _InvoiceDetailsPageState createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
  final GlobalKey<FormState> _invoiceDetailsFormKey = GlobalKey<FormState>();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessEmailController =
      TextEditingController();
  final TextEditingController _businessAddressController =
      TextEditingController();
  final TextEditingController _businessCountryController =
      TextEditingController();

  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _clientEmailController = TextEditingController();
  final TextEditingController _clientAddressController =
      TextEditingController();
  final TextEditingController _clientCountryController =
      TextEditingController();

  final TextEditingController _invoiceNumberController =
      TextEditingController();
  final TextEditingController _dateOfIssueController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _taxTypeController = TextEditingController();
  final TextEditingController _taxRateController = TextEditingController();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _productDiscountController =
      TextEditingController();
  final TextEditingController _productLineTotalController =
      TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _image;

  String? businessName;
  String? businessEmail;
  String? businessAddress;
  String? businessCountry;

  String? clientName;
  String? clientEmail;
  String? clientAddress;
  String? clientCountry;

  String? invoiceNumber;
  String? dateOfIssue;
  String? dueDate;
  String? currency;
  String? taxType;
  String taxRate = '0';

  String? productName;
  String? productDescription;
  String productPrice = '0';
  String productQuantity = '0';
  String productDiscount = '0';
  String productLineTotal = '0';

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/', (route) => false);
                            },
                            icon: const Icon(Icons.arrow_back_ios_rounded),
                          ),
                          Text(
                            'Invoice Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: dColor,
                              fontSize: 23,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('pdfPage');
                            },
                            icon: const Icon(Icons.apps),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Form(
                        key: _invoiceDetailsFormKey,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),
                                headLines(
                                    number: '01', title: 'Your Business Info'),
                                const SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () async {
                                      XFile? xfile = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      String path = xfile!.path;
                                      File file = File(path);
                                      setState(() {
                                        _image = file;
                                        invoice.image = _image!;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: lColor,
                                      backgroundImage: (_image != null)
                                          ? FileImage(_image!)
                                          : null,
                                      child: (_image != null)
                                          ? Container()
                                          : Text(
                                              'Add your logo',
                                              style: TextStyle(color: dColor),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Files must be less than 2MB.\nAccepted file formats include JPG and PNG.',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _businessNameController,
                                  hintText: 'Business name or website',
                                  onSaved: (val) {
                                    businessName = val;
                                  },
                                  textInputType: TextInputType.name,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _businessEmailController,
                                  hintText: 'Busine ss email',
                                  onSaved: (val) {
                                    businessEmail = val;
                                  },
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _businessAddressController,
                                  hintText: 'Business address',
                                  onSaved: (val) {
                                    businessAddress = val;
                                  },
                                  textInputType: TextInputType.multiline,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _businessCountryController,
                                  hintText: 'Country',
                                  onSaved: (val) {
                                    businessCountry = val;
                                  },
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 40),
                                headLines(number: '02', title: 'Client Info'),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _clientNameController,
                                  hintText: "Client's name",
                                  onSaved: (val) {
                                    clientName = val;
                                  },
                                  textInputType: TextInputType.name,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _clientEmailController,
                                  hintText: "Client's email",
                                  onSaved: (val) {
                                    clientEmail = val;
                                  },
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _clientAddressController,
                                  hintText: "Client's address",
                                  onSaved: (val) {
                                    clientAddress = val;
                                  },
                                  textInputType: TextInputType.multiline,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _clientCountryController,
                                  hintText: 'Country',
                                  onSaved: (val) {
                                    clientCountry = val;
                                  },
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 40),
                                headLines(
                                    number: '03', title: 'Invoice Settings'),
                                const SizedBox(height: 20),
                                const Text(
                                  'Details',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                textFormFields(
                                  controller: _invoiceNumberController,
                                  hintText: "Invoice Number",
                                  onSaved: (val) {
                                    invoiceNumber = val;
                                  },
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _dateOfIssueController,
                                  hintText: "Date of Issue",
                                  onSaved: (val) {
                                    dateOfIssue = val;
                                  },
                                  textInputType: TextInputType.datetime,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _dueDateController,
                                  hintText: "Due Date",
                                  onSaved: (val) {
                                    dueDate = val;
                                  },
                                  textInputType: TextInputType.datetime,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Payment',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 17),
                                textFormFields(
                                  controller: _currencyController,
                                  hintText: 'Currency',
                                  onSaved: (val) {
                                    currency = val;
                                  },
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _taxTypeController,
                                  hintText: 'Tax Type',
                                  onSaved: (val) {
                                    taxType = val;
                                  },
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 20),
                                textFormFields(
                                  controller: _taxRateController,
                                  hintText: 'Tax Rate %',
                                  onSaved: (val) {
                                    taxRate = val;
                                  },
                                  textInputType: TextInputType.number,
                                ),
                                const SizedBox(height: 40),
                                headLines(number: '04', title: 'Billing Items'),
                                const SizedBox(height: 20),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:
                                        Colors.grey.shade200.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Your Product or Service',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      textFormFields(
                                        controller: _productNameController,
                                        textInputType: TextInputType.name,
                                        hintText: 'Product Name',
                                        onSaved: (val) {
                                          productName = val;
                                        },
                                      ),
                                      const SizedBox(height: 15),
                                      const Text(
                                        'Description',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      textFormFields(
                                        controller:
                                            _productDescriptionController,
                                        hintText:
                                            "Describe the product or service",
                                        textInputType: TextInputType.multiline,
                                        onSaved: (val) {
                                          productDescription = val;
                                        },
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Price',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              SizedBox(
                                                width: 150,
                                                child: textFormFields(
                                                  controller:
                                                      _productPriceController,
                                                  hintText: "\$0.00",
                                                  textInputType:
                                                      TextInputType.number,
                                                  onSaved: (val) {
                                                    productPrice = val;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Quantity',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              SizedBox(
                                                width: 150,
                                                child: textFormFields(
                                                  controller:
                                                      _productQuantityController,
                                                  hintText: "0",
                                                  textInputType:
                                                      TextInputType.number,
                                                  onSaved: (val) {
                                                    productQuantity = val;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Discount',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              SizedBox(
                                                width: 150,
                                                child: textFormFields(
                                                  controller:
                                                      _productDiscountController,
                                                  hintText: "0",
                                                  textInputType:
                                                      TextInputType.number,
                                                  onSaved: (val) {
                                                    productDiscount = val;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const SizedBox(height: 70),
                                Align(
                                  alignment: const Alignment(0, 0),
                                  child: FloatingActionButton.extended(
                                    onPressed: () {
                                      if (_invoiceDetailsFormKey.currentState!
                                          .validate()) {
                                        _invoiceDetailsFormKey.currentState!
                                            .save();

                                        invoice.businessName = businessName;
                                        invoice.businessEmail = businessEmail;
                                        invoice.businessAddress =
                                            businessAddress;
                                        invoice.businessCountry =
                                            businessCountry;

                                        invoice.clientName = clientName;
                                        invoice.clientEmail = clientEmail;
                                        invoice.clientAddress = clientAddress;
                                        invoice.clientCountry = clientCountry;

                                        invoice.invoiceNumber = invoiceNumber;
                                        invoice.dateOfIssue = dateOfIssue;
                                        invoice.dueDate = dueDate;
                                        invoice.currency = currency;
                                        invoice.taxType = taxType;
                                        invoice.taxRate = double.parse(taxRate);

                                        invoice.productName = productName;
                                        invoice.productDescription =
                                            productDescription;
                                        invoice.productPrice =
                                            double.parse(productPrice);
                                        invoice.productQuantity =
                                            double.parse(productQuantity);
                                        invoice.productDiscount =
                                            double.parse(productDiscount);

                                        invoice.productLineTotal =
                                            (invoice.productPrice *
                                                invoice.productQuantity);

                                        invoice.discount =
                                            (invoice.productPrice *
                                                    (invoice.productDiscount /
                                                        100)) *
                                                (invoice.productQuantity);

                                        invoice.subTotal =
                                            invoice.productLineTotal;
                                        invoice.tax = (invoice.productPrice *
                                                (invoice.taxRate! / 100)) *
                                            (invoice.productQuantity);
                                        invoice.balance = (invoice.subTotal -
                                                invoice.discount) +
                                            invoice.tax;

                                        print(invoice.businessName);

                                        final snackBar = SnackBar(
                                          content: const Text(
                                              'Your Details Saved Successfully...'),
                                          backgroundColor: dColor,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    icon: const Icon(Icons.save),
                                    label: const Text("SAVE"),
                                    backgroundColor: dColor,
                                  ),
                                ),
                                Container(
                                  height: 100,
                                ),
                              ],
                            ),
                          ),
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
        const Divider(
          thickness: 3,
          color: Colors.purple,
        )
      ],
    );
  }

  Widget textFormFields({controller, hintText, onSaved, textInputType})  {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val!.isEmpty) {
          return "Enter your $hintText first";
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: textInputType,
      maxLines: null,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: dColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: lColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
