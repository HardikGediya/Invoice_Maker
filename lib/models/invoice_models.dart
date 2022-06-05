import 'dart:io';

import 'package:flutter/cupertino.dart';

Color lColor = const Color(0xffE4E5E6);
Color dColor = const Color(0xff00416A);

class Invoice {
  // 1. Business Info
  File image;
  String? businessName;
  String? businessEmail;
  String? businessAddress;
  String? businessCountry;

  // 2. Client Info
  String? clientName;
  String? clientEmail;
  String? clientAddress;
  String? clientCountry;

  // 3. Invoice Settings
  String? invoiceNumber;
  String? dateOfIssue;
  String? dueDate;
  String? currency;
  String? taxType;
  double? taxRate;

  // 4. Billing Items
  String? productName;
  String? productDescription;
  double productPrice = 0;
  double productQuantity = 0;
  double productDiscount = 0;
  double productLineTotal = 0;

  double subTotal = 0;
  double discount = 0;
  double tax = 0;
  double balance = 0;

  Invoice({
    // 1. Business Info
    required this.image,
    this.businessName,
    this.businessEmail,
    this.businessAddress,
    this.businessCountry,

    // 2. Client Info
    this.clientName,
    this.clientEmail,
    this.clientAddress,
    this.clientCountry,

    // 3. Invoice Settings
    this.invoiceNumber,
    this.dateOfIssue,
    this.dueDate,
    this.currency,
    this.taxType,
    this.taxRate,

    // 4. Billing Items
    this.productName,
    this.productDescription,
    required this.productPrice,
    required this.productQuantity,
    required this.productDiscount,
    required this.productLineTotal,
    required this.subTotal,
    required this.discount,
    required this.balance,
    required this.tax,
  });
}

Invoice invoice = Invoice(
  image: File(""),
  discount: 0,
  productPrice: 0,
  productQuantity: 0,
  balance: 0,
  subTotal: 0,
  productLineTotal: 0,
  tax: 0,
  productDiscount: 0,
);


List Pdf = [];