// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/chat/view/call_screen.dart';
import 'package:sizer/sizer.dart';

class MoreWidget extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String trailing;
  final double height;
  bool istext;
  VoidCallback onpress;
  bool isonline;

  MoreWidget(
      {super.key,
      required this.onpress,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.trailing,
      required this.height,
      required this.istext,
      required this.isonline});

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpress,
      child: Container(
        width: 91.w,
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        height: 12.h,
        decoration: BoxDecoration(
            color: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.bottomNavigation
                : R.colors.white,
            borderRadius: BorderRadius.circular(22)),
        child: Row(
          children: [
            SizedBox(
              width: 3.w,
            ),
            Image.asset(
              widget.image,
              width: 19.w,
              height: 19.h,
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  widget.title,
                  style: R.textStyle.bentonSansMedium(
                    FontWeight.w400,
                    11.sp,
                    TextDecoration.none,
                    Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.white
                        : R.colors.obsidianShard,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Visibility(
                      visible: widget.isonline,
                      child: Image.asset(
                        R.images.online,
                        width: 1.6.w,
                        height: 1.6.h,
                      ),
                    ),
                    SizedBox(
                      width: 1.2.w,
                    ),
                    Text(
                      widget.subtitle,
                      style: R.textStyle.bentonSansRegularRegular(
                          FontWeight.w400,
                          10.5.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white.withOpacity(.3)
                              : R.colors.darkGray.withOpacity(.3)),
                    ),
                  ],
                ),
                trailing: Visibility(
                    visible: widget.istext,
                    replacement: GestureDetector(
                      onTap: () {
                        Get.toNamed(CallScreen.route);
                      },
                      child: Image.asset(
                        R.images.call,
                        height: 5.7.h,
                        width: 12.w,
                      ),
                    ),
                    child: Text(
                      '20:00',
                      style: R.textStyle.bentonSansRegularRegular(
                          FontWeight.w400,
                          10.5.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white.withOpacity(.3)
                              : R.colors.darkGray.withOpacity(.3)),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
