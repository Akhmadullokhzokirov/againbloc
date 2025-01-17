import 'dart:core';
import 'dart:ui';
import 'package:againbloc/pages/pages/home/bloc/home_page_bloc.dart';
import 'package:againbloc/pages/pages/home/bloc/home_page_event.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:againbloc/common/value/colors.dart';
import 'package:againbloc/pages/pages/home/bloc/home_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../../common/widgets/base_text_widget.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                "assets/icons/person.png",
              ))),
            ),
          )
        ],
      ),
    ),
  );
}

// reusable big text
Widget homepageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: "search your course",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintStyle: TextStyle(
                        color: AppColors.primarySecondaryElementText)),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

// # for sliderView
Widget sliderView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/icons/background.png"),
            _slidersContainer(path: "assets/icons/background.png"),
            _slidersContainer(path: "assets/icons/background.png")
          ],
        ),
      ),
      Container(
          child: DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
      ))
    ],
  );
}

//# slider widget

Widget _slidersContainer({String path = "assets/icons/background.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

// menu view for items

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusaableText("Choose your course"),
            GestureDetector(
                child: reusaableText("See all",
                    color: AppColors.primaryThreeElementText, fontSize: 10))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
           _reusableMenuText("All"),
            _reusableMenuText("Popular", textColor: AppColors.primaryThreeElementText, backGroundColor: Colors.white),
            _reusableMenuText("Newest", textColor: AppColors.primaryThreeElementText, backGroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}



// for the menu buttons, reusable text

Widget _reusableMenuText(String menuText, {Color textColor= AppColors.primaryElementText, Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: backGroundColor),
    ),
    child: reusaableText(menuText,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: 11),
    padding: EdgeInsets.only(
        left: 15.w, right: 15.w, bottom: 5.h, top: 5.h),
  );
}

// for course grid view ui
Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
                "assets/icons/background.png"))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp),
        ),
        SizedBox(height: 5.h,),
        Text(
          "Fllutter best practice",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryThreeElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp),
        ),
      ],
    ),
  );
}