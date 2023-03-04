import 'package:co_ordinators/screens/SignIn/bloc/SignIn_event.dart';
import 'package:co_ordinators/screens/SignIn/bloc/SignIn_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextFieldChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.password.length < 8) {
        emit(SignInErrorState("Please enter a valid password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
    on<SignInLoadingEvent>((event, emit) {
      emit(SignInNextState());
    });

  }
}
