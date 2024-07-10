// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/auth/view/login_screen_view.dart';

import 'package:masmas/src/landing/first_screen.dart';
import 'package:masmas/src/landing/second_screen.dart';

import 'package:sizer/sizer.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Utilis/Button.dart';

class NewScreen extends StatefulWidget {
  static String route = "/newscreen";
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  PageController controller = PageController();
  bool onlastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              onlastpage = (index == 1);
            });
          },
          children: const [FirstScreen(), SecondScreen()],
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: SlideEffect(
                    dotHeight: 0,
                    dotColor: R.colors.white,
                    dotWidth: 0,
                  ),
                ),
              ),
              onlastpage
                  ? MyButton(
                      width: 40.w,
                      height: 7.h,
                      title: LocalizationMap.getValues('next'),
                      onpress: () {
                        Get.offAllNamed(LoginScreen.route);
                      })
                  : MyButton(
                      width: 40.w,
                      height: 7.h,
                      onpress: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      title: LocalizationMap.getValues('next'),
                    ),
            ]))
      ]),
    );
  }
}
