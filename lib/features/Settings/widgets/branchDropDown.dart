import 'package:flutter/material.dart';

class BranchDropDown extends StatefulWidget {
  const BranchDropDown({super.key});

  @override
  State<BranchDropDown> createState() => _BranchDropDownState();
}

class _BranchDropDownState extends State<BranchDropDown> {
  String? _selectedbranch;
  List<String> _branches = ['Comps', 'IT', 'AI-DS', 'CE-IoT', 'AI-ML'];
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
              value: _selectedbranch,
              items: _branches
                  .map((branch) => DropdownMenuItem(
                        value: branch,
                        child: Text(branch,
                            style: const TextStyle(color: Colors.white)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedbranch = value;
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
