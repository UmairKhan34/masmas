import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/src/auth/view/picture_view.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/utilis/widget/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';
import '../../../resources/app_localization.dart';

class PaymentMethodView extends StatefulWidget {
  static String route = "/payment_method";
  const PaymentMethodView({super.key});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white.withOpacity(1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalWidget(
                showText: false,
                image: R.images.patternBack,
                text: LocalizationMap.getValues('payment_method'),
                subtitle: LocalizationMap.getValues(
                    'this_data_will_be_displayed_in_your_account_profile_for_security')),
            myContainer(
                R.images.paypal,
                Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.white.withOpacity(.3)
                    : R.colors.whiteSmoke.withOpacity(.9)),
            SizedBox(
              height: 3.h,
            ),
            myContainer(
                R.images.visas,
                Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.white.withOpacity(.3)
                    : R.colors.whiteSmoke.withOpacity(.9)),
            SizedBox(
              height: 3.h,
            ),
            myContainer(
                R.images.payment,
                Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.white.withOpacity(.3)
                    : R.colors.whiteSmoke.withOpacity(.9)),
            SizedBox(
              height: 23.h,
            ),
            Center(
                child: MyButton(
                    width: 40.w,
                    height: 7.h,
                    title: LocalizationMap.getValues('next'),
                    onpress: () {
                      Get.toNamed(UploadPicture.route);
                    }))
          ],
        ),
      ),
    );
  }

  Widget myContainer(String image, Color containerColor) {
    return Center(
      child: Container(
        height: 10.h,
        width: 90.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: containerColor),
        child: Center(
          child: Image.asset(
            image,
            height: 9.h,
            width: 22.w,
          ),
        ),
      ),
    );
  }
}
