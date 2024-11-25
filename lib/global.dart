import 'package:againbloc/common/routes/bloc_observed.dart';
import 'package:againbloc/common/service/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp(
        //options: DefaultFirebaseOptions.currentPlatform
         );
     storageService = await StorageService().init();
  }
}