import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearn/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearn/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PassowrdEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PassowrdEvent event, Emitter<SignInState> emit) {
    print(event.passowrd);
    emit(state.copyWith(password: event.passowrd));
  }
}
