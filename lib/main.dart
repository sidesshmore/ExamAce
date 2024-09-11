import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/SplashScreen/ui/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
      },
      home: SplashScreen(),
    ),
  );
}
