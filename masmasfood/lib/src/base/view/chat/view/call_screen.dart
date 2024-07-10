import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/chat/view/chat_review.dart';
import 'package:sizer/sizer.dart';

class CallScreen extends StatefulWidget {
  static String route = "/call_screen";
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool onpress = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: Stack(
              //alignment: Alignment.center,
              children: [
                Image.asset(R.images.patternImage),
                Positioned(
                  top: 25.h,
                  right: 0.h,
                  left: 1,
                  child: Image.asset(
                    R.images.callimage,
                    height: 25.h,
                    width: 161.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            'Richard Lewis',
            style: R.textStyle.bentonSansBold(
                FontWeight.w400,
                21.sp,
                TextDecoration.none,
                Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.white
                    : R.colors.obsidianShard),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            LocalizationMap.getValues('ringing'),
            style: R.textStyle.bentonSansRegularRegular(
                FontWeight.w400,
                16.sp,
                TextDecoration.none,
                Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.white.withOpacity(.7)
                    : R.colors.darkGray.withOpacity(.3)),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myContainer(onpress ? R.images.volumne : R.images.volumneoff,
                  R.colors.tealGreen.withOpacity(.1), () {
                setState(() {
                  onpress = !onpress;
                });
              }),
              SizedBox(
                width: 5.w,
              ),
              myContainer(R.images.closicon, R.colors.bloodBurst, () {
                Get.offNamed(ChatReview.route);
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget myContainer(String image, Color color, VoidCallback onpress) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 10.h,
        width: 21.9.w,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(130)),
        child: Center(
            child: Image.asset(
          image,
          height: 2.5.h,
          width: 19.8.w,
        )),
      ),
    );
  }
}
