import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';

import 'package:sizer/sizer.dart';

import '../../../../../utilis/google_map/location_screen.dart';
import '../../chat/view/widget/common_widget.dart';

class LocationScreenView extends StatefulWidget {
  static String route = "/location_screen_view";
  const LocationScreenView({super.key});

  @override
  State<LocationScreenView> createState() => _LocationScreenViewState();
}

class _LocationScreenViewState extends State<LocationScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white.withOpacity(.01),
      body: Column(
        children: [
          CommonWidget(
            image: R.images.patternBack,
            text: LocalizationMap.getValues('shipping'),
            height: 18.9.h,
            onpress: () {
              Get.back();
            },
          ),
          SizedBox(
            height: 3.h,
          ),
          myLocation(
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.white,
              LocalizationMap.getValues('order_location'),
              '8502 Preston Rd. Inglewood, \nMaine 98380',
              R.images.location,
              R.textStyle.bentonSansRegularRegular(
                  FontWeight.w400,
                  11.sp,
                  TextDecoration.none,
                  Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.white.withOpacity(.3)
                      : R.colors.darkGray.withOpacity(.3)),
              R.textStyle.bentonSansMedium(
                  FontWeight.w400,
                  12.sp,
                  TextDecoration.none,
                  Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.white
                      : R.colors.obsidianShard),
              12.5.h,
              '',
              R.textStyle.bentonSansRegularRegular(FontWeight.w400, 11.sp,
                  TextDecoration.none, R.colors.pineGreen),
              false),
          SizedBox(
            height: 3.h,
          ),
          myLocation(
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.white,
              LocalizationMap.getValues('deliver_to'),
              '4517 Washington Ave. Manchester, \nKentucky 39495',
              R.images.location,
              R.textStyle.bentonSansRegularRegular(
                  FontWeight.w400,
                  11.sp,
                  TextDecoration.none,
                  Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.white.withOpacity(.3)
                      : R.colors.darkGray.withOpacity(.3)),
              R.textStyle.bentonSansMedium(
                  FontWeight.w400,
                  12.sp,
                  TextDecoration.none,
                  Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.white
                      : R.colors.obsidianShard),
              17.5.h,
              LocalizationMap.getValues('set_location'),
              R.textStyle.bentonSansRegularRegular(FontWeight.w400, 11.sp,
                  TextDecoration.none, R.colors.tealGreen),
              true),
        ],
      ),
    );
  }

  Widget myLocation(
      Color containerColor,
      String text,
      String location,
      String image,
      TextStyle style,
      TextStyle locationstyle,
      double height,
      String button,
      TextStyle locationbutton,
      bool value) {
    return Container(
      height: height,
      width: 90.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: containerColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 2.w,
              ),
              Text(
                text,
                style: style,
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 4.w,
              ),
              Image.asset(
                image,
                height: 33,
                width: 33,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                location,
                style: locationstyle,
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.w,
              ),
              Visibility(
                visible: value,
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(LocationScreen.route);
                    },
                    child: Text(
                      button,
                      style: locationbutton,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
