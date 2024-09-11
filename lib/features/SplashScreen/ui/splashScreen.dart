import 'dart:async';
import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/MainScreen/ui/mainScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      _controller.reverse().then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Mainscreen()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Transform.rotate(
                          angle: _rotationAnimation.value * 6.28319,
                          child: child,
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/sparkle.png',
                      height: screenHeight * 0.45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                'ExamAce',
                style: TextStyle(
                    fontSize: screenWidth * 0.13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                width: screenWidth * (351 / 432),
                child: Text(
                  textAlign: TextAlign.center,
                  'Your Shortcut to Top-Quality Exam Answers',
                  style: TextStyle(
                      color: Colors.grey[850],
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
