part of 'welcome_bloc.dart';

@immutable
class WelcomeState {
  int page;

  WelcomeState({this.page = 0});
}

final class WelcomeInitial extends WelcomeState {}
