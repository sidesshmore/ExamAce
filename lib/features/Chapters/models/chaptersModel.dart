import 'package:flutter/material.dart';

class ChapDetails {
  final Color backColor;
  final Color numColor;
  final String chapNum;
  final String chapName;

  ChapDetails({
    required this.backColor,
    required this.numColor,
    required this.chapNum,
    required this.chapName,
  });
}

List<ChapDetails> chapList = [
  ChapDetails(
    backColor: Colors.green.shade300,
    numColor: Colors.green.shade800,
    chapName: 'Chapter 1 Name',
    chapNum: '01',
  ),
  ChapDetails(
    backColor: Colors.blue.shade300,
    numColor: Colors.blue.shade800,
    chapName: 'Chapter 2 Name',
    chapNum: '02',
  ),
  ChapDetails(
    backColor: Colors.orange.shade300,
    numColor: Colors.orange.shade800,
    chapName: 'Chapter 3 Name',
    chapNum: '03',
  ),
  ChapDetails(
    backColor: Colors.red.shade300,
    numColor: Colors.red.shade800,
    chapName: 'Chapter 4 Name',
    chapNum: '04',
  ),
  ChapDetails(
    backColor: Colors.purple.shade300,
    numColor: Colors.purple.shade800,
    chapName: 'Chapter 5 Name',
    chapNum: '05',
  ),
  ChapDetails(
    backColor: Colors.teal.shade300,
    numColor: Colors.teal.shade800,
    chapName: 'Chapter 6 Name',
    chapNum: '06',
  ),
];
