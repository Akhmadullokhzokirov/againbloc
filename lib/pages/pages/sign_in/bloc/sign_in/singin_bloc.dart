import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'singin_state.dart';

part 'singin_event.dart';


class SignInBloc extends Bloc<SinginEvent, SignInState> {
  SignInBloc() : super (const SignInState()){
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }
   
   void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    //  print("my email is ${event.email}");
      emit(state.copyWith(email: event.email));
   }
     void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
     // print("my email is ${event.password}");
      emit(state.copyWith(password: event.password));
   }
}