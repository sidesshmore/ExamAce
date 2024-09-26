import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:examace/features/Login/repo/loginRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClicked>(loginButtonClicked);
    on<LoginWithGoogleButtonClicked>(loginWithGoogleButtonClicked);
    on<SignupButtonClicked>(signupButtonClicked);
  }

  FutureOr<void> loginButtonClicked(LoginButtonClicked event, Emitter<LoginState> emit) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email=event.email;
    String password=event.password;
    User? user=await LoginRepo.login(event.email, event.password);
    if(user==null){
      emit(NavigateToErrorScreen());
    }else{
      await prefs.setString('uid',user.uid);
     emit(NavigateToMainScreen());
    }
  }

  FutureOr<void> loginWithGoogleButtonClicked(LoginWithGoogleButtonClicked event, Emitter<LoginState> emit) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    UserCredential? credentials=await LoginRepo.loginwithgoogle();
    if(credentials==null){
      emit(NavigateToErrorScreen());
    }else{
    await prefs.setString('uid', credentials.user!.uid);
    emit(NavigateToMainScreen());
    }
  }

  FutureOr<void> signupButtonClicked(SignupButtonClicked event, Emitter<LoginState> emit) {
    emit(NavigateToSignupScreen());
  }
}
