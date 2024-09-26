part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginActionState extends LoginState{}

class NavigateToMainScreen extends LoginActionState{}

class NavigateToSignupScreen extends LoginActionState{}

class NavigateToErrorScreen extends LoginActionState{}
