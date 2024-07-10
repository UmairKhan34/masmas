// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/base/view/home/view/notifications_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/resources.dart';

class MyWidget extends StatefulWidget {
  final VoidCallback onpress;
  const MyWidget({
    super.key,
    required this.onpress,
  });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27.6.h,
      child: Stack(
        children: [
          Positioned(child: Image.asset(R.images.patternBack)),
          Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    LocalizationMap.getValues('find_your_favorite_food'),
                    style: R.textStyle.bentonSansBold(
                        FontWeight.w400,
                        24.sp,
                        TextDecoration.none,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white
                            : R.colors.obsidianShard),
                  ),
                  Container(
                    height: 5.7.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.bottomNavigation
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(NotificationScreen.route);
                        },
                        child: Image.asset(
                          R.images.bell,
                          height: 3.h,
                          width: 8.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                      ),
                      child: TextFormField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          keyboardType: TextInputType.text,
                          cursorColor: R.colors.peach.withOpacity(.1),
                          decoration: R.fieldDecoration.decoration(
                              filled: true,
                              hint: LocalizationMap.getValues(
                                  'what_do_you_want_to_order'),
                              textStyle: R.textStyle.googleFontRoboto(
                                  FontWeight.w400,
                                  9.5.sp,
                                  TextDecoration.none,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white.withOpacity(.4)
                                      : R.colors.red.withOpacity(.4)),
                              radius: 15,
                              fillcolor: R.colors.peach.withOpacity(.09),
                              borderColor: R.colors.peach.withOpacity(0),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white
                                    : R.colors.orange,
                              ))),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onpress,
                    child: Image.asset(
                      R.images.filter,
                      scale: 3.2,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
//R.colors.peach.withOpacity(.0)
// R.textStyle.googleFontRoboto(
                         //       FontWeight.w400,
                         //       9.5.sp,
                           //     TextDecoration.none,
                             //   R.colors.orange.withOpacity(.4)),




                            //  InputDecoration(
                            // hintText: 'What do you want to order? ',
                            // hintStyle: R.textStyle.googleFontRoboto(
                            //     FontWeight.w400,
                            //     9.5.sp,
                            //     TextDecoration.none,
                            //     R.colors.orange.withOpacity(.4)),
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.only(left: 8.0),
                            //   child: Image.asset(
                            //     R.images.search,
                            //     scale: 5,
                            //   ),
                            // ),
                            // fillColor: R.colors.peach.withOpacity(.1),
                            // filled: true,
                            // border: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: R.colors.peach.withOpacity(.0)),
                            //     borderRadius: BorderRadius.circular(15)),
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: R.colors.peach.withOpacity(.0)),
                            //     borderRadius: BorderRadius.circular(15)),
                            // enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: R.colors.peach.withOpacity(.0)),
                            //     borderRadius: BorderRadius.circular(15))),
                      