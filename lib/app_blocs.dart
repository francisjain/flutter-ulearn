import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearn/app_events.dart';
import 'package:ulearn/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitialState()) {
    on<Increment>((event, emit) {
      print("event");
      emit(AppStates(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }
}
