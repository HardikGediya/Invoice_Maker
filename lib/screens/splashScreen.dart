import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../models/invoice_models.dart';
import 'Login Process/signInPage.dart';
import 'HOME/homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Transform.scale(
          scale: 2,
            child: Image.asset('assets/images/ApkLogoWithDarkText.png')),
        backgroundColor: lColor,
        nextScreen: const SignInPage(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
