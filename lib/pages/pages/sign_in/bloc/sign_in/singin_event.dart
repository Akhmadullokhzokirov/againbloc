part of 'singin_bloc.dart';

@immutable
abstract class SinginEvent {
  const SinginEvent();
}
 class EmailEvent extends SinginEvent {
  final String email;
  const EmailEvent(this.email);
 }

  class PasswordEvent extends SinginEvent {
  final String password;
  const PasswordEvent(this.password);
 }
