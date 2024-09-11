import 'dart:async';

import 'package:examace/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.7),
          end: FractionalOffset(0.0, 1),
          colors: [
            Color(0xffFABC3F),
            Color(0xFFDDD4C2),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/sparkle.png',
                  height: screenHeight * 0.45,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              'ExamAce',
              style: TextStyle(
                  fontSize: screenWidth * 0.13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: screenWidth * (351 / 432),
              child: Text(
                textAlign: TextAlign.center,
                'Your Shortcut to Top-Quality Exam Answers',
                style: TextStyle(
                    fontSize: screenWidth * 0.055, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
