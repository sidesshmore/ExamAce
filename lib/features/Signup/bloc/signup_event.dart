part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupButtonClicked extends SignupEvent{
  final String name;
  final String email;
  final String password;

  SignupButtonClicked({required this.name, required this.email, required this.password});
}

class SignupWithGoogleButtonClicked extends SignupEvent{

}

class LoginButtonClicked extends SignupEvent{
  
}
