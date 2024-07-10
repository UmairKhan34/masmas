import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/chat/view/widget/common_widget.dart';

import 'package:masmas/utilis/button.dart';
import 'package:sizer/sizer.dart';

class VoucherScreen extends StatefulWidget {
  static String route = "/voucher_screen";
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonWidget(
              onpress: () {
                Get.back();
              },
              image: R.images.patternBack,
              text: LocalizationMap.getValues('voucher_promo'),
              height: 19.7.h),
          SizedBox(
            height: 3.h,
          ),
          Image.asset(
            R.images.promo,
            width: 92.w,
            height: 22.h,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Image.asset(
            R.images.voucher,
            width: 92.w,
            height: 22.h,
          ),
          SizedBox(
            height: 22.h,
          ),
          MyButton(
            title: LocalizationMap.getValues('check_out'),
            onpress: () {
              Get.back();
            },
            height: 8.h,
            width: 90.w,
          )
        ],
      ),
    );
  }
}
