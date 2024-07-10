import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/auth/view/new_password.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/utilis/widget/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';

class ForgotOptionsViews extends StatefulWidget {
  static String route = "/forget_options";
  const ForgotOptionsViews({super.key});

  @override
  State<ForgotOptionsViews> createState() => _ForgotOptionsViewsState();
}

class _ForgotOptionsViewsState extends State<ForgotOptionsViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalWidget(
              showText: false,
              image: R.images.patternBack,
              text: LocalizationMap.getValues('forgot_password'),
              subtitle: LocalizationMap.getValues(
                  'select_which_contact_details_should_we_use_to_reset_your_password')),
          commonContainer(
              R.images.message,
              LocalizationMap.getValues('via_sms'),
              R.images.frameSms,
              14.h,
              90.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white.withOpacity(.1)
                  : R.colors.darkGray.withOpacity(.05)),
          SizedBox(
            height: 4.h,
          ),
          commonContainer(
              R.images.email,
              LocalizationMap.getValues('via_email'),
              R.images.frameGmail,
              12.h,
              90.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white.withOpacity(.1)
                  : R.colors.darkGray.withOpacity(.05)),
          SizedBox(
            height: 28.h,
          ),
          Center(
              child: MyButton(
                  width: 40.w,
                  height: 7.h,
                  title: LocalizationMap.getValues('next'),
                  onpress: () {
                    Get.toNamed(NewPassword.route);
                  }))
        ],
      ),
    );
  }

  Widget commonContainer(String image, String text, String images,
      double height, double width, Color containerColor) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left: 3.w),
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(22)),
      child: Row(
        children: [
          SizedBox(
            width: 5.w,
          ),
          Image.asset(
            image,
            width: 12.w,
            height: 7.0.h,
          ),
          SizedBox(
            width: 2.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.5.h,
              ),
              Text(
                text,
                style: R.textStyle.bentonSansRegularRegular(
                    FontWeight.w400, 13.sp, TextDecoration.none, R.colors.gray),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Image.asset(
                images,
                width: 35.w,
                height: 4.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
