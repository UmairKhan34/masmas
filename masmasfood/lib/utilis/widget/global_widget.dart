// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';

import 'package:sizer/sizer.dart';

import '../../resources/resources.dart';

class GlobalWidget extends StatefulWidget {
  final String image;
  final String subtitle;
  final String? timeText;
  final String? numberText;
  final String? anotherText;
  bool showText;
  bool showRich;
  final String text;
  GlobalWidget(
      {super.key,
      this.timeText,
      this.numberText,
      this.anotherText,
      required this.image,
      required this.text,
      required this.showText,
      this.showRich = true,
      required this.subtitle});

  @override
  State<GlobalWidget> createState() => _GlobalWidgetState();
}

class _GlobalWidgetState extends State<GlobalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 31.4.h,
        child: Stack(children: [
          Positioned(child: Image.asset(widget.image)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      R.images.backButton,
                      width: 5.4.h,
                      height: 5.4.h,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4.0.w,
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
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  Visibility(
                    visible: widget.showText,
                    replacement: Text(
                      widget.subtitle,
                      style: R.textStyle.bentonSansBook(
                          FontWeight.w400,
                          10.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white
                              : R.colors.obsidianShard),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.subtitle,
                            style: R.textStyle.bentonSansBook(
                                FontWeight.w400,
                                10.sp,
                                TextDecoration.none,
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white
                                    : R.colors.obsidianShard),
                          ),
                          TextSpan(
                            text: widget.numberText,
                            style: R.textStyle.bentonSansBook(
                                FontWeight.w400,
                                10.sp,
                                TextDecoration.none,
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white
                                    : R.colors.obsidianShard),
                          ),
                          TextSpan(
                            text: widget.anotherText,
                            style: R.textStyle.bentonSansBook(
                                FontWeight.w400,
                                10.sp,
                                TextDecoration.none,
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white
                                    : R.colors.obsidianShard),
                          ),
                          TextSpan(
                            text: widget.timeText,
                            style: R.textStyle.bentonSansBook(
                                FontWeight.w400,
                                10.sp,
                                TextDecoration.none,
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white
                                    : R.colors.obsidianShard),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ]));
  }
}
