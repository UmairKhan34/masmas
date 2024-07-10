import 'package:flutter/material.dart';
import 'package:masmas/resources/resources.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final double? height;
  final double? width;
  const MyButton(
      {super.key,
      required this.title,
      required this.onpress,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [R.colors.tealGreen, R.colors.pineGreen]),
            borderRadius: BorderRadius.circular(15)),
        height: height,
        width: width,
        child: Center(
            child: Text(title,
                style: R.textStyle.bentonSansBold(FontWeight.w400, 11.sp,
                    TextDecoration.none, R.colors.white))),
      ),
    );
  }
}
