import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/MainScreen/ui/mainScreen.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
          body: Column(
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
            ],
          )),
    );
  }
}
