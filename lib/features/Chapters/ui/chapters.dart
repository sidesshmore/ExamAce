import 'package:examace/features/Chapters/models/chaptersModel.dart';
import 'package:examace/features/Chapters/widgets/chapterCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chapters extends StatefulWidget {
  const Chapters({super.key});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  @override
  Widget build(BuildContext context) {
    chapList;
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: width * 0.95,
                height: height * 0.783,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ChapterCard(
                      backColor: chapList[index].backColor,
                      numColor: chapList[index].numColor,
                      chapName: chapList[index].chapName,
                      chapNum: chapList[index].chapNum,
                    );
                  },
                  itemCount: chapList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
