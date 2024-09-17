import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SemesterCard extends StatefulWidget {
  final int index;
  final int currentIndex;
  final String content;

  const SemesterCard({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.content,
  });

  @override
  State<SemesterCard> createState() => _SemesterCardState();
}

class _SemesterCardState extends State<SemesterCard> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSelected = widget.index == widget.currentIndex;

    return Container(
      height: screenHeight * 0.1,
      width: screenWidth * 0.3,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffFEBA04) : Colors.white,
        border: Border.all(width: 1, color: Color(0xffFEBA04)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.content,
            style: GoogleFonts.inter(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
