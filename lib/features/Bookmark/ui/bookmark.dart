import 'package:examace/features/MainScreen/ui/mainScreen.dart';
import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainscreen()),
              );
            },
          ),
          title: Text('Saved',
              style: TextStyle(
                  fontSize: screenWidth * 27 / 432,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
