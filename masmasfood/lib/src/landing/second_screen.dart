import 'package:flutter/material.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/resources.dart';
import 'package:sizer/sizer.dart';

import '../../resources/app_localization.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
              child: Image.asset(R.images.llustartionImageSecond, height: 50.h),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              LocalizationMap.getValues('food_ninja_is_where_your'),
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
              height: 1.h,
            ),
            Text(LocalizationMap.getValues('comfort_food_lives'),
                textAlign: TextAlign.center,
                style: R.textStyle.bentonSansBold(
                    FontWeight.w400,
                    17.5.sp,
                    TextDecoration.none,
                    Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.white
                        : R.colors.obsidianShard)),
            SizedBox(
              height: 5.h,
            ),
            Text(
              LocalizationMap.getValues(
                  'enjoy_a_fast_and_smooth_food_delivery_at'),
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
            Text(
              LocalizationMap.getValues('your_doorstep'),
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
              height: 8.h,
            ),
          ],
        ));
  }
}
