import 'package:flutter/material.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/resources.dart';
import 'package:sizer/sizer.dart';

import '../../resources/app_localization.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constant.themeMode == "ThemeMode.dark"
            ? R.colors.profileScreen
            : R.colors.white.withOpacity(.01),
        body: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Image.asset(R.images.ilustartionImage, height: 50.h),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(LocalizationMap.getValues('find_your_comfort'),
                textAlign: TextAlign.center,
                style: R.textStyle.bentonSansBold(
                    FontWeight.w400,
                    17.5.sp,
                    TextDecoration.none,
                    Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.white
                        : R.colors.obsidianShard)),
            SizedBox(
              height: 1.h,
            ),
            Text(
              LocalizationMap.getValues('food_here'),
              textAlign: TextAlign.center,
              style: R.textStyle.bentonSansBold(
                  FontWeight.w400,
                  17.5.sp,
                  TextDecoration.none,
                  Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.white
                      : R.colors.obsidianShard),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              LocalizationMap.getValues(
                  'here_you_can_find_a_chef_or_dish_for_every'),
              textAlign: TextAlign.center,
              style: R.textStyle.bentonSansBook(
                  FontWeight.w400,
                  10.sp,
                  TextDecoration.none,
                  Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.white
                      : R.colors.obsidianShard),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(LocalizationMap.getValues('taste_and_color_enjoy'),
                textAlign: TextAlign.center,
                style: R.textStyle.bentonSansBook(
                    FontWeight.w400,
                    12,
                    TextDecoration.none,
                    Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.white
                        : R.colors.obsidianShard)),
            SizedBox(
              height: 8.h,
            ),
          ],
        ));
  }
}
