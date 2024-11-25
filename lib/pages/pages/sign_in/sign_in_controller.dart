import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/flutter_toast.dart';
import 'bloc/sign_in/singin_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

 Future<void> handleSignIn(String type) async{
    try {
      if(type == 'email'){
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty) {
         toastInfo(msg: "You need to fill  email address");
         return;
        }
        if(password.isEmpty) {
          
           toastInfo(msg: "You need to fill  password address");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress, password: password);
            if(credential.user == null){
              //
              toastInfo(msg: "You don't exist");
            }
            if(!credential.user!.emailVerified) {
              toastInfo(msg: "You need to verify your email account");
              return;
            }
           var user = credential.user;
           if(user != null){
            print("user exist");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
           }else {
             toastInfo(msg: "Currently you are not a user of this app");
             return;
           }
         
        } on FirebaseAuthException catch (e) {
          if (e.code == "user not found") {
          // todosinfo(message: "No user found that email.")
            print("No user found for that email.");
             toastInfo(msg: "No user found for that email.");
             return;
             
          }else if (e.code == "wrong password") {
            print("wrong password provided for that user.");
             toastInfo(msg: "wrong password provided for that user.");
             return;

          }else if (e.code == "invalid-email") {
            print("Invalid email");
             toastInfo(msg: "Invalid email");
             return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }


}
