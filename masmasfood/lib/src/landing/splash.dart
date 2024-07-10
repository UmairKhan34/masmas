import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'new_Screen.dart';

class SplashScreen extends StatefulWidget {
  static String route = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(NewScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BaseVM>(
      context,
    );
    return Scaffold(
        backgroundColor: provider.themeMode == ThemeMode.dark
            ? R.colors.profileScreen
            : R.colors.white,
        body: Stack(
          children: [
            Positioned(child: Image.asset(R.images.patternImage)),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Image.asset(
                    R.images.logoimage,
                    height: 23.h,
                  ),
                  Center(
                    child: Image.asset(
                      R.images.appNameImage,
                      width: 30.h,
                      fit: BoxFit.cover,
                    ),
                  )
                ]),
          ],
        ));
  }
}
