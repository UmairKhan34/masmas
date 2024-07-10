import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/chat/view/widget/common_widget.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  static String route = "/notification_screen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: Column(
        children: [
          CommonWidget(
              onpress: () {
                Get.back();
              },
              image: R.images.patternBack,
              text: LocalizationMap.getValues('notification'),
              height: 20.h),
          SizedBox(
            height: 2.5.h,
          ),
          myContainer(
              R.images.check,
              'Your order has been taken by \nthe driver',
              'Recently',
              14.h,
              90.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.white,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white
                  : R.colors.obsidianShard,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white.withOpacity(.3)
                  : R.colors.white.withOpacity(.3)),
          SizedBox(
            height: 2.5.h,
          ),
          myContainer(
              R.images.money,
              'Topup for \$100 was successful',
              '10.00 Am',
              11.h,
              90.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.white,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white
                  : R.colors.obsidianShard,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white.withOpacity(.3)
                  : R.colors.white.withOpacity(.3)),
          SizedBox(
            height: 2.5.h,
          ),
          myContainer(
              R.images.button,
              'Your order has been canceled',
              '22 Juny 2021',
              11.h,
              90.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.white,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white
                  : R.colors.obsidianShard,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white.withOpacity(.3)
                  : R.colors.white.withOpacity(.3)),
        ],
      ),
    );
  }

  Widget myContainer(
      String image,
      String title,
      String subtitle,
      double height,
      double width,
      Color containerColor,
      Color titleColor,
      Color subtitleColor) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: containerColor),
      child: Row(
        children: [
          SizedBox(
            width: 3.w,
          ),
          Image.asset(
            image,
            width: 4.5.h,
            height: 12.w,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: R.textStyle.bentonSansMedium(
                    FontWeight.w400, 12.sp, TextDecoration.none, titleColor),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                subtitle,
                style: R.textStyle.bentonSansRegularRegular(
                    FontWeight.w400, 11.sp, TextDecoration.none, subtitleColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
