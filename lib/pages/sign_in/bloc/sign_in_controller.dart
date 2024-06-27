import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearn/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          print("email empty");
        }
        if (password.isEmpty) {
          print("password is empty");
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            print("user doesnt exist");
          }
          if (!credential.user!.emailVerified) {
            print("email not exist");
          }
          var user = credential.user;
          if (user != null) {
            print("user exist");
          } else {
            print("user not exist");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("No user found for that email.");
          } else if (e.code == 'wrong-password') {
            print("Wrong password provided for that user.");
          }
        }
      }
    } catch (e) {}
  }
}
