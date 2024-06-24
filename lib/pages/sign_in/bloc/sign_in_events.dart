abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}

class PassowrdEvent extends SignInEvent {
  final String passowrd;
  const PassowrdEvent(this.passowrd);
}
