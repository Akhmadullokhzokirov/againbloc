//
// import 'package:againbloc/common/entities/user.dart';
// import 'package:againbloc/global.dart';
// import 'package:againbloc/pages/pages/home/bloc/home_page_bloc.dart';
// import 'package:flutter/cupertino.dart';
//
// class HomeController{
//   final BuildContext context;
//   UserItem userProfile = Global.storageService.getUserProfile();
// HomeController({required.context});
//
// Future<void> int async {
//   if(Global.storageService.getUserToken().isNotEmpty) {
//     var result = await CourseAPI.courseList();
//     if(result.code == 200){
//
//       if(context.mounted){
//     context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
//
// }
// }else {
//       print(result.code);
// }
// }
// }
//
// }