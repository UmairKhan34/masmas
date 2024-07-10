// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/auth/view/profile_ready_view.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/utilis/widget/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';

class UserLocationView extends StatefulWidget {
  static String route = "/user_location";
  const UserLocationView({super.key});

  @override
  State<UserLocationView> createState() => _UserLocationViewState();
}

class _UserLocationViewState extends State<UserLocationView> {
  Location location = Location();
  String currentLocation = LocalizationMap.getValues('your_location');
  Future<void> _getLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation =
            "Latitude: ${userLocation.latitude}, Longitude: ${userLocation.longitude}";
      });
    } catch (e) {
      log("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.whiteSmoke.withOpacity(1),
      body: Column(
        children: [
          GlobalWidget(
              showText: false,
              image: R.images.patternBack,
              text: LocalizationMap.getValues('set_your_location'),
              subtitle: LocalizationMap.getValues(
                  'this_data_will_be_displayed_in_your_account_profile_for_security')),
          Row(
            children: [
              SizedBox(
                width: 4.w,
              ),
              Container(
                width: 90.w,
                height: 18.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.white.withOpacity(.1)
                        : R.colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Image.asset(
                          R.images.location,
                          width: 13.w,
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          currentLocation,
                          style: R.textStyle.bentonSansMedium(
                              FontWeight.w400,
                              11.5.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.obsidianShard),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: _getLocation,
                      child: Container(
                        child: Center(
                          child: Text(LocalizationMap.getValues('set_location'),
                              style: R.textStyle.googleFontRubik(
                                  FontWeight.w400,
                                  11.5.sp,
                                  TextDecoration.none,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white
                                      : R.colors.obsidianShard)),
                        ),
                        width: 85.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white.withOpacity(.1)
                                : R.colors.whiteSmoke),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Center(
              child: MyButton(
                  width: 40.w,
                  height: 7.h,
                  title: LocalizationMap.getValues('next'),
                  onpress: () {
                    Get.toNamed(AlmostReady.route);
                  }))
        ],
      ),
    );
  }
}
