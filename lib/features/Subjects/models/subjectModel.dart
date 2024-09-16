import 'package:flutter/material.dart';

class SubjectDetails {
  final Color backColor;
  final Color numColor;
  final String chapNum;
  final String chapName;

  SubjectDetails({
    required this.backColor,
    required this.numColor,
    required this.chapNum,
    required this.chapName,
  });
}

List<SubjectDetails> subjectsList = [
  // SubjectDetails(
  //   backColor: Colors.green.shade300,
  //   numColor: Colors.green.shade800,
  //   chapName: 'Network Communication Models',
  //   chapNum: '01',
  // ),
  // SubjectDetails(
  //   backColor: Colors.blue.shade300,
  //   numColor: Colors.blue.shade800,
  //   chapName: 'L1 Carrier Technology',
  //   chapNum: '02',
  // ),
  // SubjectDetails(
  //   backColor: Colors.orange.shade300,
  //   numColor: Colors.orange.shade800,
  //   chapName: 'Managing COMMANDO Devices',
  //   chapNum: '03',
  // ),
  SubjectDetails(
    backColor: Colors.red.shade300,
    numColor: Colors.red.shade800,
    chapName: 'Computer Networks',
    chapNum: '01',
  ),
  SubjectDetails(
    backColor: Colors.purple.shade300,
    numColor: Colors.purple.shade800,
    chapName: 'Data Warehouse and Mining',
    chapNum: '02',
  ),
  SubjectDetails(
    backColor: Colors.indigo.shade300,
    numColor: Colors.indigo.shade800,
    chapName: 'Artificial Intelligence',
    chapNum: '03',
  ),
  SubjectDetails(
    backColor: Colors.teal.shade300,
    numColor: Colors.teal.shade800,
    chapName: 'Web Computing',
    chapNum: '04',
  ),
  SubjectDetails(
    backColor: Colors.deepPurple.shade300,
    numColor: Colors.deepPurple.shade800,
    chapName: 'Statistics for Artificial Intelligence',
    chapNum: '05',
  ),
];
