// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmas/resources/resources.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/app_localization.dart';

class ButtonWidget extends StatefulWidget {
  VoidCallback onpress;
  ButtonWidget({super.key, required this.onpress});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpress,
      child: Container(
        width: 88.w,
        height: 7.h,
        decoration: BoxDecoration(
            color: R.colors.snowColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            LocalizationMap.getValues('place_my_order'),
            style: R.textStyle.bentonSansBold(FontWeight.w400, 11.sp,
                TextDecoration.none, R.colors.tealGreen),
          ),
        ),
      ),
    );
  }
}
