import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearn/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearn/pages/sign_in/bloc/sign_in_controller.dart';
import 'package:ulearn/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearn/pages/sign_in/bloc/signin_states.dart';
import 'package:ulearn/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(),
                  Center(
                      child:
                          reuseableText("Or use your email account to login")),
                  Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText("Email"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your email address", "text", "user",
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reuseableText("Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your password address", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PassowrdEvent(value));
                          }),
                          forgotPassword(),
                          buildLogInAndRegButton("Log In", "login", () {
                            SignInController(context: context)
                                .handleSignIn("email");
                          }),
                          buildLogInAndRegButton("Register", "register", () {}),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
