import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChapterCard extends StatelessWidget {
  ChapterCard(
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
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    double numPosition = height * 0.055;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            height: height * 0.17,
            width: width * 0.42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: backColor,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width * 0.42,
              height: height * 0.055,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7)),
              ),
              child: Center(
                child: Text(
                  chapName,
                  style: TextStyle(
                      fontSize: height * 0.019,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: numPosition,
            child: Container(
              width: width * 0.132,
              height: height * 0.034,
              decoration: BoxDecoration(
                color: numColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
              ),
              child: Center(
                child: Text(
                  chapNum,
                  style: TextStyle(
                      fontSize: height * 0.017,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
