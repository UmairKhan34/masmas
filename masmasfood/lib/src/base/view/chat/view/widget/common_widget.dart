// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmas/constants/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/resources.dart';

class CommonWidget extends StatefulWidget {
  final String image;
  final String text;
  VoidCallback onpress;
  final double height;

  CommonWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.onpress,
      required this.height});

  @override
  State<CommonWidget> createState() => _CommonWidgetState();
}

class _CommonWidgetState extends State<CommonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: .9,
              image: AssetImage(
                widget.image,
              ),
              fit: BoxFit.cover)),
      height: widget.height,
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 2.5.h,
                  ),
                  GestureDetector(
                    onTap: widget.onpress,
                    child: Image.asset(
                      R.images.backButton,
                      width: 5.4.h,
                      height: 5.4.h,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 2.5.h,
                  ),
                  Text(
                    widget.text,
                    style: R.textStyle.bentonSansBold(
                        FontWeight.w400,
                        20.sp,
                        TextDecoration.none,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white
                            : R.colors.obsidianShard),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
