import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard(
      {super.key,
      required this.backColor,
      required this.numColor,
      required this.chapNum,
      required this.chapName});

  final Color backColor;
  final Color numColor;
  final String chapNum;
  final String chapName;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: screenHeight * 0.15,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: numColor, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Text(
                chapNum,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                chapName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
