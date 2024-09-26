import 'package:examace/features/Home/ui/home.dart';
import 'package:examace/features/Login/bloc/login_bloc.dart';
import 'package:examace/features/MainScreen/ui/mainScreen.dart';
import 'package:examace/features/Signup/ui/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final LoginBloc loginbloc=LoginBloc();
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginbloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is !LoginActionState,
      listener: (context, state) {
        if(state is NavigateToMainScreen){
          Navigator.popAndPushNamed(context, 'subjects');
        }
        else if(state is NavigateToSignupScreen){
          Navigator.popAndPushNamed(context, 'signup');
        }
        else if(state is NavigateToErrorScreen){
          Navigator.popAndPushNamed(context, 'signup');
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
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
                  SizedBox(height: screenHeight * 0.05),
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
                          onPressed: () {
                            loginbloc.add(LoginButtonClicked(email: email.text, password: password.text));
                          },
                          child: Text(
                            'Log In',
                            style: GoogleFonts.poppins(
                                fontSize: screenHeight * 0.025,
                                color: Colors.white),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          loginbloc.add(LoginWithGoogleButtonClicked());
                        },
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
                                  'Log In with Google',
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
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.017,
                            fontWeight: FontWeight.w300),
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: InkWell(
                              onTap: () {
                                loginbloc.add(SignupButtonClicked());
                              },
                              child: Text(
                                ' Sign up',
                                style: GoogleFonts.poppins(
                                    fontSize: screenHeight * 0.017,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffFEBA04),
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        const Color.fromRGBO(14, 15, 60, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
