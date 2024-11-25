import 'package:againbloc/pages/pages/application/bloc/app_events.dart';
import 'package:againbloc/pages/pages/application/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState>{
  AppBlocs() : super(const AppState()){
    on<TriggerAppEvent>((event, emit) {
    //  print("my tapped index is ${event.index}"); // for check page index
      emit(AppState(index: event.index));
    });
  }
}