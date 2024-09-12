import 'package:flutter/material.dart';

class SemDropDown extends StatefulWidget {
  const SemDropDown({super.key});

  @override
  State<SemDropDown> createState() => _SemDropDownState();
}

class _SemDropDownState extends State<SemDropDown> {
  String? _selectedsemester;
  List<String> _semesters = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII'];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
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
                            style: const TextStyle(color: Colors.white)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedsemester = value;
                });
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffA3A3A3), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: TextStyle(
                    color: Colors.white, fontSize: screenWidth * 0.05),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
