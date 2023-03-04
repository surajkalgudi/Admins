abstract class SignInEvent {}

class SignInTextFieldChangedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInTextFieldChangedEvent(this.email, this.password);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}
class SignInLoadingEvent extends SignInEvent {}

class SignInForgotPasswordEvent extends SignInEvent {}

class SignInRegisterNowEvent extends SignInEvent {}
