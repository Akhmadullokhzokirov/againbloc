import 'package:againbloc/common/routes/routes.dart';
import 'package:againbloc/common/value/constant.dart';
import 'package:againbloc/global.dart';
import 'package:againbloc/pages/pages/application/bloc/app_bloc.dart';
import 'package:againbloc/pages/pages/application/bloc/app_events.dart';
import 'package:againbloc/pages/pages/home/bloc/home_page_bloc.dart';
import 'package:againbloc/pages/pages/home/bloc/home_page_event.dart';
import 'package:againbloc/pages/pages/profile/settings/blocs/settings_blocs.dart';
import 'package:againbloc/pages/pages/profile/settings/blocs/settings_states.dart';
import 'package:againbloc/pages/pages/profile/settings/widgets/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingPageState();
}


class _SettingPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    // homepage qayta ochilishi uchun
   context.read<HomePageBlocs>().add(const HomePageDots(0)); // qaytadan kirganda dots yana 0 tenglash uchun
    Global.storageService.remove(
        AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(
        AppConstants.STORAGE_USER_PRFILE_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingsStates>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                settingsButton(context, removeUserData),
              ],
            ),
          );
        },
      )),
    );
  }
}
