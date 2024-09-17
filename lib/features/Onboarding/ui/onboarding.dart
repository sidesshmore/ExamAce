import 'package:examace/features/Onboarding/widgets/branchCard.dart';
import 'package:examace/features/Onboarding/widgets/semCard.dart';
import 'package:examace/features/Onboarding/widgets/yearCard.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final ScrollController _branchScrollController = ScrollController();
  final ScrollController _yearScrollController = ScrollController();
  final ScrollController _semesterScrollController = ScrollController();

  int _currentBranchIndex = 0;
  int _currentYearIndex = 0;
  int _currentSemesterIndex = 0;

  @override
  void initState() {
    super.initState();
    _branchScrollController.addListener(_onBranchScroll);
    _yearScrollController.addListener(_onYearScroll);
    _semesterScrollController.addListener(_onSemesterScroll);
  }

  @override
  void dispose() {
    _branchScrollController.removeListener(_onBranchScroll);
    _branchScrollController.dispose();
    _yearScrollController.removeListener(_onYearScroll);
    _yearScrollController.dispose();
    _semesterScrollController.removeListener(_onSemesterScroll);
    _semesterScrollController.dispose();
    super.dispose();
  }

  void _onBranchScroll() {
    double offset = _branchScrollController.offset;
    double itemWidth = MediaQuery.of(context).size.width * 0.79;
    double viewportCenter =
        _branchScrollController.position.viewportDimension / 2;

    int currentIndex = (offset + viewportCenter) ~/ itemWidth;

    if (currentIndex != _currentBranchIndex) {
      setState(() {
        _currentBranchIndex = currentIndex;
      });
    }
  }

  void _onYearScroll() {
    double offset = _yearScrollController.offset;
    double itemWidth = MediaQuery.of(context).size.width * 0.59;
    double viewportCenter =
        _yearScrollController.position.viewportDimension / 2;

    int currentIndex = (offset + viewportCenter) ~/ itemWidth;

    if (currentIndex != _currentYearIndex) {
      setState(() {
        _currentYearIndex = currentIndex;
        _currentSemesterIndex = 0;
      });
    }
  }

  void _onSemesterScroll() {
    double offset = _semesterScrollController.offset;
    double itemWidth = MediaQuery.of(context).size.width * 0.59;
    double viewportCenter =
        _semesterScrollController.position.viewportDimension / 2;

    int currentIndex = (offset + viewportCenter) ~/ itemWidth;

    if (currentIndex != _currentSemesterIndex) {
      setState(() {
        _currentSemesterIndex = currentIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<String> branchNames = [
      "Computer Science Engineering",
      "Artificial Intelligence and Data Science",
      "Artificial Intelligence and Machine Learning",
      "Computer Science Engineering and IoT",
      "Mechanical Engineering",
      "Electrical and Computer Science",
      "Information Technology",
      "Electronics and Telecommunication"
    ];

    List<String> yearNames = [
      "First Year",
      "Second Year",
      "Third Year",
      "Final Year",
    ];

    List<String> semesterNames = [];
    switch (_currentYearIndex) {
      case 0: // First Year
        semesterNames = ["Sem I", "Sem II"];
        break;
      case 1: // Second Year
        semesterNames = ["Sem III", "Sem IV"];
        break;
      case 2: // Third Year
        semesterNames = ["Sem V", "Sem VI"];
        break;
      case 3: // Final Year
        semesterNames = ["Sem VII", "Sem VIII"];
        break;
      default:
        semesterNames = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Branch Name:',
                  style: TextStyle(
                      fontSize: screenWidth * (23 / 432),
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFEBA04)),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.9,
                  child: ListView.separated(
                    controller: _branchScrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BranchCard(
                        index: index,
                        currentIndex: _currentBranchIndex,
                        content: branchNames[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: screenWidth * 0.09,
                      );
                    },
                    itemCount: branchNames.length,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.023,
            ),
            Divider(),
            SizedBox(
              height: screenHeight * 0.023,
            ),
            Row(
              children: [
                Text(
                  'Year: ',
                  style: TextStyle(
                      fontSize: screenWidth * (23 / 432),
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFEBA04)),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.9,
                  child: ListView.separated(
                    controller: _yearScrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return YearCard(
                        index: index,
                        currentIndex: _currentYearIndex,
                        content: yearNames[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: screenWidth * 0.09,
                      );
                    },
                    itemCount: yearNames.length,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.023,
            ),
            Divider(),
            SizedBox(
              height: screenHeight * 0.023,
            ),
            Row(
              children: [
                Text(
                  'Semester: ',
                  style: TextStyle(
                      fontSize: screenWidth * (23 / 432),
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFEBA04)),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.9,
                  child: ListView.separated(
                    controller: _semesterScrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SemesterCard(
                        index: index,
                        currentIndex: _currentSemesterIndex,
                        content: semesterNames[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: screenWidth * 0.09,
                      );
                    },
                    itemCount: semesterNames.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
