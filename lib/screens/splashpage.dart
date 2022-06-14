import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:testing/commonstyle/constrants.dart';
import 'package:testing/screens/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      splash: Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.fitHeight,
      ),
      backgroundColor: whiteColor,
      nextScreen: loginpage(size: size),
      duration: 1500,
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
