import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:invoice_app/screens/Information/read2.dart';

import '../../models/invoice_models.dart';


class ReadAndMove extends StatefulWidget {
  const ReadAndMove({Key? key}) : super(key: key);

  @override
  _ReadAndMoveState createState() => _ReadAndMoveState();
}

class _ReadAndMoveState extends State<ReadAndMove> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Text('Get Started\nwith Our Free\nInvoice Maker',style: TextStyle(color: dColor,fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: lColor,
        nextScreen: const Read2(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
