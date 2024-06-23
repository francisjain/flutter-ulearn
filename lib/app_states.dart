class AppStates {
  int counter;
  AppStates({required this.counter});
}

class InitialState extends AppStates {
  InitialState() : super(counter: 0);
}
