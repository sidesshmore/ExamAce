import 'package:flutter/material.dart';

class BugReport extends StatefulWidget {
  const BugReport({super.key});

  @override
  State<BugReport> createState() => _BugReportState();
}

class _BugReportState extends State<BugReport> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: screenHeight * 0.05,
          width: screenWidth * 0.95,
          decoration: BoxDecoration(
              color: Color(0xff262626),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.bug_report_outlined,
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                Text(
                  'Bug report',
                  style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
