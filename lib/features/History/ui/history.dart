import 'package:examace/features/MainScreen/ui/mainScreen.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
          title: Text('History',
              style: TextStyle(
                  fontSize: screenWidth * 36 / 432,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
