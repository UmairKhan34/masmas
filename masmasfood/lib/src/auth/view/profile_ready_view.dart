import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/auth/view/login_screen_view.dart';
import 'package:masmas/resources/resources.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';

class AlmostReady extends StatefulWidget {
  static String route = "/almost_ready";
  const AlmostReady({super.key});

  @override
  State<AlmostReady> createState() => _AlmostReadyState();
}

class _AlmostReadyState extends State<AlmostReady> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.whiteSmoke.withOpacity(1),
      body: Stack(
        children: [
          Positioned(child: Image.asset(R.images.patternImage)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: Image.asset(
                  R.images.congrats,
                  width: 35.w,
                  height: 15.h,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(LocalizationMap.getValues('congrats'),
                  style: R.textStyle.bentonSansBold(FontWeight.w400, 24.5.sp,
                      TextDecoration.none, R.colors.tealGreen)),
              SizedBox(
                height: 2.h,
              ),
              Text(LocalizationMap.getValues('your_profile_is_ready_to_use'),
                  style: R.textStyle.bentonSansBold(
                      FontWeight.w400,
                      18.sp,
                      TextDecoration.none,
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard)),
              SizedBox(
                height: 30.h,
              ),
              MyButton(
                  width: 40.w,
                  height: 7.h,
                  title: LocalizationMap.getValues('try_order'),
                  onpress: () {
                    Get.offAllNamed(LoginScreen.route);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
