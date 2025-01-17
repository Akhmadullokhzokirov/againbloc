import 'package:againbloc/pages/pages/register/bloc/register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    print("${event.userName}");
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
     print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
     print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
     print("${event.rePassword}");
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
