import 'package:flutter/material.dart';
import 'package:invoice_app/screens/HOME/invoiceDetailsPage.dart';
import 'package:invoice_app/screens/Information/read2.dart';
import 'package:invoice_app/screens/Information/readAndMove.dart';

import 'screens/HOME/pdfPage.dart';
import 'screens/Login Process/signInPage.dart';
import 'screens/Login Process/signUpPage.dart';
import 'screens/splashScreen.dart';
import 'screens/HOME/homePage.dart';

void main(){
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        'splashScreen' : (context) => const SplashScreen(),
        'signInPage' : (context) => const SignInPage(),
        'signUpPage' : (context) => const SignUpPage(),
        'readAndMovePage' : (context) => const ReadAndMove(),
        'read2' : (context) => const Read2(),
        '/' : (context) => const HomePage(),
        'invoiceDetailsPage' : (context) => const InvoiceDetailsPage(),
        'pdfPage' : (context) => const PdfPage(),
      },
    );
  }
}

