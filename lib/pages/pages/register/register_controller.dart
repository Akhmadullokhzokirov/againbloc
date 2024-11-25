import 'package:againbloc/common/widgets/flutter_toast.dart';
import 'package:againbloc/pages/pages/register/bloc/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  void handleEmailRegister() async{
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password  cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your Password confirmation is wrong");
      return;
    }
    try {

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password
        
        );

        if(credential.user!= null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(userName);
          toastInfo(msg: "An email has been sent to your register email. To activate it please check your email box and clic on the link");
          Navigator.of(context).pop();

        }
      
    }on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password') {
        toastInfo(msg: "The Password provided is too weak");
      } else if(e.code == 'email-already-in-use') {
        toastInfo(msg: "The email already in use");
      } else if(e.code == 'invalid-email') {
        toastInfo(msg: "Your email id is invalid");
      }
      
    }
  }
}
