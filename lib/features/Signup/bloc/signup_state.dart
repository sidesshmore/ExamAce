part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupActionState extends SignupState{}

class NavigateToOnboardingScreen extends SignupActionState{}

class NavigateToLoginScreen extends SignupActionState{}

class NavigateToErrorScreen extends SignupActionState{}