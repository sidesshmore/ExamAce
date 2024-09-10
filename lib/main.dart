import 'package:examace/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(initialRoute: 'home', routes: {
    'home': (context) => Home(),
  }));
}
