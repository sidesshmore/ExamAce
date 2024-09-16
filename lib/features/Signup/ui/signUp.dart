// import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:examace/features/Login/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    _passwordVisible = false;
  }

  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final name = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Signup',
                  style: GoogleFonts.inter(
                      fontSize: 70, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      label: Text('Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter your name",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter your email-id",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    obscureText: !_passwordVisible,
                    controller: password,
                    decoration: InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter your password",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.81,
                  height: screenHeight * 0.064,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFEBA04),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.025, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Divider(
                thickness: 2,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("assets/google.png"),
                      height: 48,
                      width: 48,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 8),
                      child: Text(
                        'Sign Up with Google',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text.rich(
                TextSpan(
                  text: 'Already have an account?',
                  style: GoogleFonts.poppins(
                      fontSize: screenHeight * 0.017,
                      fontWeight: FontWeight.w300),
                  children: <InlineSpan>[
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Login();
                            }),
                          );
                        },
                        child: Text(
                          ' Login',
                          style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.017,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffFEBA04),
                            decoration: TextDecoration.underline,
                            decorationColor:
                                const Color.fromRGBO(14, 15, 60, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      )),
    );
  }
}
