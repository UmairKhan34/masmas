import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/auth/view/login_screen_view.dart';
import 'package:masmas/resources/resources.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';

class ConfirmationView extends StatefulWidget {
  static String route = "/confirmation_password";
  const ConfirmationView({super.key});

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
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
                height: 02.h,
              ),
              Text(LocalizationMap.getValues('congrats'),
                  style: R.textStyle.bentonSansBold(FontWeight.w400, 24.5.sp,
                      TextDecoration.none, R.colors.tealGreen)),
              SizedBox(
                height: 02.h,
              ),
              Text(LocalizationMap.getValues('password_reset_succesful'),
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
                  title: LocalizationMap.getValues('back'),
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
