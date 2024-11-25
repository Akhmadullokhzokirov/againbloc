import 'package:againbloc/common/routes/name.dart';
import 'package:againbloc/global.dart';
import 'package:againbloc/pages/pages/application/application_page.dart';
import 'package:againbloc/pages/pages/application/bloc/app_bloc.dart';
import 'package:againbloc/pages/pages/course/blocs/course_details_blocs.dart';
import 'package:againbloc/pages/pages/course/course_detail.dart';
import 'package:againbloc/pages/pages/home/bloc/home_page_bloc.dart';
import 'package:againbloc/pages/pages/home/home_page.dart';
import 'package:againbloc/pages/pages/profile/settings/blocs/settings_blocs.dart';
import 'package:againbloc/pages/pages/profile/settings/settings_page.dart';
import 'package:againbloc/pages/pages/register/bloc/register/register_bloc.dart';
import 'package:againbloc/pages/pages/register/register.dart';
import 'package:againbloc/pages/pages/sign_in/bloc/sign_in/singin_bloc.dart';
import 'package:againbloc/pages/pages/sign_in/sign_in.dart';
import 'package:againbloc/pages/pages/welcome/bloc/welcome_bloc.dart';
import 'package:againbloc/pages/pages/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
        PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(create: (_) => HomePageBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(create: (_) => SettingsBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.COURSE_DETAIL,
          page: const CourseDetail( ),
          bloc: BlocProvider(create: (_) => CourseDetailsBloc(),)
      ),
    ];
  }

    // return all the bloc provider
    static List<dynamic> allBlocProviders(BuildContext context) {
      List<dynamic> blocProviders = <dynamic>[];
      for (var bloc in routes()) {
        blocProviders.add(bloc.bloc);
      }
      return blocProviders;
    }


  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
    if (result.isNotEmpty) {
        print("first log");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){

          return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }
}

// unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page,  this.bloc});
}
