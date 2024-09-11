import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/SplashScreen/ui/splashScreen.dart';
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
      },
      home: SplashScreen(),
    ),
  );
}
