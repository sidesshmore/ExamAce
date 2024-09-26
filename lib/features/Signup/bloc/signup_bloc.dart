import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:examace/features/Signup/repo/signupRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonClicked>(signupButtonClicked);
    on<SignupWithGoogleButtonClicked>(signupWithGoogleButtonClicked);
    on<LoginButtonClicked>(loginButtonClicked);
  }

  FutureOr<void> signupButtonClicked(SignupButtonClicked event, Emitter<SignupState> emit) async{
    String name=event.name;
    String email=event.email;
    String password=event.password;
    User? user=await SignupRepo.register(name, email, password);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(user==null){
      emit(NavigateToErrorScreen());
    }
    else{
      await prefs.setString('uid',user.uid);
      emit(NavigateToOnboardingScreen());
    }
  }

  FutureOr<void> signupWithGoogleButtonClicked(SignupWithGoogleButtonClicked event, Emitter<SignupState> emit) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    UserCredential? credentials=await SignupRepo.signupwithgoogle();
    if(credentials==null){
      emit(NavigateToErrorScreen());
    }else{
    await prefs.setString('uid', credentials.user!.uid);
    emit(NavigateToOnboardingScreen());
    }
  }

  FutureOr<void> loginButtonClicked(LoginButtonClicked event, Emitter<SignupState> emit) {
    emit(NavigateToLoginScreen());
  }
}
