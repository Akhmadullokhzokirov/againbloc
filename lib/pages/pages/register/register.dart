import 'package:againbloc/pages/pages/register/bloc/register/register_bloc.dart';
import 'package:againbloc/pages/pages/register/bloc/register/register_state.dart';
import 'package:againbloc/pages/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../welcome/common_widgets/common_widgets.dart';

class Register extends StatefulWidget {
  static const String routeName = '/register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: reusableText(
                          "Enter your details below and free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        buildTextField(
                          "Enter your user name",
                          "name",
                          "user",
                          (value) {
                             context.read<RegisterBloc>().add(UserNameEvent(value));
                          },
                        ),
                        reusableText("Email"),
                        buildTextField(
                          "Enter your email address",
                          "email",
                          "user",
                          (value) {
                              context.read<RegisterBloc>().add(EmailEvent(value));
                          },
                        ),
                        reusableText("Password"),
                        buildTextField(
                          "Enter your  password",
                          "password",
                          "lock",
                          (value) {
                             context.read<RegisterBloc>().add(PasswordEvent(value));
                          },
                        ),
                        reusableText("Confirm Password"),
                        buildTextField(
                          "Enter your Confirm password",
                          "password",
                          "lock",
                          (value) {
                           context.read<RegisterBloc>().add(RePasswordEvent(value));
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: reusableText(
                        "By creating an account you have to agree with our them"),
                  ),
                  buildLogInAndRegButton("Sign Up", "login", () {
                    Navigator.of(context).pushNamed('register');
                    RegisterController(context:context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
