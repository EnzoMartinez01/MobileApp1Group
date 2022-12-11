import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:v4s/screens/LoginScreen.dart';
import 'package:page_transition/page_transition.dart';

class LoadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset('././images/logov4s.png'),
          nextScreen: LoginScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.black,
      ),
    );
  }
}