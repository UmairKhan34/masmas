// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/cart/view/widget/button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/app_localization.dart';

class CommonCartWidget extends StatefulWidget {
  static String route = "/common_cart";
  VoidCallback onpress;
  CommonCartWidget({super.key, required this.onpress});

  @override
  State<CommonCartWidget> createState() => _CommonCartWidgetState();
}

class _CommonCartWidgetState extends State<CommonCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 93.w,
        height: 24.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                R.images.background,
              ),
              opacity: 0.55),
          borderRadius: BorderRadius.circular(20),
          gradient:
              LinearGradient(colors: [R.colors.tealGreen, R.colors.pineGreen]),
        ),
        child: Column(
          children: [
            myCharges(
                LocalizationMap.getValues('sub_total'),
                '120 \$',
                R.textStyle.bentonSansMedium(FontWeight.w400, 11.sp,
                    TextDecoration.none, R.colors.snowColor)),
            myCharges(
                LocalizationMap.getValues('delivery_charge'),
                '10 \$',
                R.textStyle.bentonSansMedium(FontWeight.w400, 11.sp,
                    TextDecoration.none, R.colors.snowColor)),
            myCharges(
                LocalizationMap.getValues('discount'),
                '20 \$',
                R.textStyle.bentonSansMedium(FontWeight.w400, 11.sp,
                    TextDecoration.none, R.colors.snowColor)),
            SizedBox(
              height: 1.h,
            ),
            myCharges(
                LocalizationMap.getValues('total'),
                '150 \$',
                R.textStyle.bentonSansBold(FontWeight.w400, 15.sp,
                    TextDecoration.none, R.colors.snowColor)),
            // SizedBox(
            //   height: 2.5.h,
            // ),
            ButtonWidget(onpress: widget.onpress)
          ],
        ));
  }

  Widget myCharges(
    String title,
    String subtitle,
    TextStyle style,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, top: 1.h),
          child: Text(title, style: style),
        ),
        Padding(
          padding: EdgeInsets.only(right: 6.w, top: 1.h),
          child: Text(subtitle, style: style),
        ),
      ],
    );
  }
}
