abstract class SignUpState {}

class InitialState extends SignUpState {}

class LoadingState extends SignUpState {}

class SuccessState extends SignUpState {}

class ErrorState extends SignUpState {
  String error;
  ErrorState(this.error);
}
