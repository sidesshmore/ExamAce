import 'package:examace/features/Subjects/models/subjectModel.dart';
import 'package:examace/features/Subjects/widgets/subjectCard.dart';
import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    subjectsList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects',
            style: TextStyle(
                fontSize: screenWidth * 27 / 432, fontWeight: FontWeight.w600)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return SubjectCard(
                  backColor: subjectsList[index].backColor,
                  numColor: subjectsList[index].numColor,
                  chapName: subjectsList[index].chapName,
                  chapNum: subjectsList[index].chapNum,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: screenHeight * 0.01,
                );
              },
              itemCount: subjectsList.length)),
    );
  }
}
