import 'package:examace/features/Chapters/ui/chapters.dart';
import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/Login/ui/login.dart';
import 'package:examace/features/Signup/ui/signUp.dart';
import 'package:examace/features/SplashScreen/ui/splashScreen.dart';
import 'package:examace/features/Subjects/ui/subjects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      // initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'login': (context) => Login(),
        'signup': (context) => Signup(),
        'subjects': (context) => Subjects(),
        'chapters': (context) => Chapters(),
      },
      home: SplashScreen(),
    ),
  );
}
