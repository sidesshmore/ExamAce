import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/MainScreen/ui/mainScreen.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? _selectedbranch;
  List<String> _branches = ['Comps', 'IT', 'AI-DS', 'CE-IoT', 'AI-ML'];
  String? _selectedsemester;
  List<String> _semesters = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII'];
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
            title: Text('Profile',
                style: TextStyle(
                    fontSize: screenWidth * 36 / 432,
                    fontWeight: FontWeight.w400)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * (95 / 432),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.png',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sidessh More',
                        style: TextStyle(
                            fontSize: screenWidth * 36 / 432,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('mosiddhesh@gmail.com',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey[600],
                            fontSize: screenWidth * 18 / 432,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]))
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Text('Branch: ',
                        style: TextStyle(
                            fontSize: screenWidth * 17 / 432,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.95,
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xff262626),
                          value: _selectedbranch,
                          items: _branches
                              .map((branch) => DropdownMenuItem(
                                    value: branch,
                                    child: Text(branch,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedbranch = value;
                            });
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffA3A3A3), width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.05),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Row(
                  children: [
                    Text('Semester: ',
                        style: TextStyle(
                            fontSize: screenWidth * 17 / 432,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.95,
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xff262626),
                          value: _selectedsemester,
                          items: _semesters
                              .map((semester) => DropdownMenuItem(
                                    value: semester,
                                    child: Text(semester,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedsemester = value;
                            });
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffA3A3A3), width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.05),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
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
                )
              ],
            ),
          )),
    );
  }
}
