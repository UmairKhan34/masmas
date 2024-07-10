import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';

import 'package:sizer/sizer.dart';

import '../../chat/view/widget/common_widget.dart';

class EditPaymentScreen extends StatefulWidget {
  static String route = "/edit_payment";
  const EditPaymentScreen({super.key});

  @override
  State<EditPaymentScreen> createState() => _EditPaymentScreenState();
}

class _EditPaymentScreenState extends State<EditPaymentScreen> {
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
            text: LocalizationMap.getValues('payment'),
            height: 18.9.h,
            onpress: () {
              Get.back();
            },
          ),
          SizedBox(
            height: 3.h,
          ),
          myContainer(
              R.images.paypal,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.white,
              7.h,
              21.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white
                  : R.colors.darkGray),
          SizedBox(
            height: 3.h,
          ),
          myContainer(
              R.images.visas,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.whiteSmoke,
              7.h,
              18.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white
                  : R.colors.darkGray.withOpacity(.3)),
          SizedBox(
            height: 3.h,
          ),
          myContainer(
              R.images.payment,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.whiteSmoke,
              7.h,
              21.w,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.white
                  : R.colors.darkGray.withOpacity(.3))
        ],
      ),
    );
  }

  Widget myContainer(String image, Color colors, double imageheight,
      double imagewidth, Color payment) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 9.3.h,
        width: 92.w,
        padding: EdgeInsets.only(left: 4.0.w, right: 4.0.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: colors),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: imageheight,
              width: imagewidth,
            ),
            Text(
              '2121 6352 8465 ****',
              style: R.textStyle.bentonSansRegularRegular(
                  FontWeight.w400, 11.sp, TextDecoration.none, payment),
            )
          ],
        ),
      ),
    );
  }
}
