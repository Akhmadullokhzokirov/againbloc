import 'package:againbloc/common/routes/page.dart';
import 'package:againbloc/common/value/colors.dart';
import 'package:againbloc/global.dart';
import 'package:againbloc/pages/bloc_provider.dart';
import 'package:againbloc/pages/pages/application/application_page.dart';
import 'package:againbloc/pages/pages/welcome/welcome.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
          // AppBlocProvider.allBlocProviders
          [
        ...AppPages.allBlocProviders(context),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // error solved
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: AppColors.primaryText)),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}
