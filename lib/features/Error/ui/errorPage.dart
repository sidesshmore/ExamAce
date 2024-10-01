import 'package:examace/features/Login/ui/login.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error!',
                  style: TextStyle(
                      fontSize: screenWidth * 50 / 432,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            child: Image.asset(
              fit: BoxFit.fill,
              'assets/errorPage.png',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Something went wrong \n Please Try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: screenWidth * 24 / 432,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.orange,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: Text(
              'Try Again',
              style: TextStyle(
                fontSize: screenWidth * 20 / 432,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
