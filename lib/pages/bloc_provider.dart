import 'package:againbloc/pages/pages/register/bloc/register/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/sign_in/bloc/sign_in/singin_bloc.dart';
import 'pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProvider {
  static get allBlocProviders=>[
     BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        // BlocProvider(
        //   create: (context) => AppBloc(),
        // ),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc())
  ];
}