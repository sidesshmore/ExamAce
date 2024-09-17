import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchCard extends StatefulWidget {
  final int index;
  final int currentIndex;
  final String content;

  const BranchCard({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.content,
  });

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSelected = widget.index == widget.currentIndex;

    return Container(
      height: screenHeight * 0.086,
      width: screenWidth * 0.7,
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
