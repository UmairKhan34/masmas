import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/home/view/voucher_screen.dart';
import 'package:masmas/utilis/button.dart';
import 'package:sizer/sizer.dart';

class ChatReview extends StatefulWidget {
  static String route = "/review_screen";
  const ChatReview({super.key});

  @override
  State<ChatReview> createState() => _ChatReviewState();
}

class _ChatReviewState extends State<ChatReview> {
  TextEditingController myController = TextEditingController();
  FocusNode node = FocusNode();
  int currentindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 45.h,
              child: Stack(
                //alignment: Alignment.center,
                children: [
                  Image.asset(R.images.patternImage),
                  Positioned(
                    top: 21.h,
                    right: 12.h,
                    left: 24.w,
                    child: currentindex == 1
                        ? Image.asset(
                            R.images.personImage,
                            height: 20.h,
                            width: 134.w,
                          )
                        : currentindex == 2
                            ? Image.asset(
                                R.images.meat,
                                height: 24.h,
                                width: 80.w,
                              )
                            : myContainer(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            currentindex == 1
                ? Text(
                    LocalizationMap.getValues('thank_you_order_completed'),
                    textAlign: TextAlign.center,
                    style: R.textStyle.bentonSansBold(
                        FontWeight.w400,
                        21.sp,
                        TextDecoration.none,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white
                            : R.colors.obsidianShard),
                  )
                : currentindex == 2
                    ? Text(
                        LocalizationMap.getValues('thank_you_enjoy_your_meal'),
                        textAlign: TextAlign.center,
                        style: R.textStyle.bentonSansBold(
                            FontWeight.w400,
                            21.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard),
                      )
                    : Text(
                        LocalizationMap.getValues('thank_you_enjoy_your_meal'),
                        textAlign: TextAlign.center,
                        style: R.textStyle.bentonSansBold(
                            FontWeight.w400,
                            21.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard),
                      ),
            SizedBox(
              height: 3.h,
            ),
            currentindex == 1
                ? Text(
                    LocalizationMap.getValues('please_rate_your_last_driver'),
                    style: R.textStyle.bentonSansRegularRegular(
                        FontWeight.w400,
                        11.5.sp,
                        TextDecoration.none,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white.withOpacity(.7)
                            : R.colors.darkGray.withOpacity(.3)),
                  )
                : currentindex == 2
                    ? Text(
                        LocalizationMap.getValues('please_rate_your_food'),
                        style: R.textStyle.bentonSansRegularRegular(
                            FontWeight.w400,
                            11.5.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white.withOpacity(.7)
                                : R.colors.darkGray.withOpacity(.3)),
                      )
                    : Text(
                        LocalizationMap.getValues(
                            'please_rate_your_restaurant'),
                        style: R.textStyle.bentonSansRegularRegular(
                            FontWeight.w400,
                            11.5.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white.withOpacity(.7)
                                : R.colors.darkGray.withOpacity(.3)),
                      ),
            SizedBox(
              height: 5.h,
            ),
            RatingBar.builder(
                minRating: 1,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.7.w),
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: R.colors.yellow,
                    ),
                onRatingUpdate: (rating) {}),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: TextFormField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  controller: myController,
                  focusNode: node,
                  keyboardType: TextInputType.text,
                  decoration: R.fieldDecoration.decoration(
                    hint: LocalizationMap.getValues('leave_feedback'),
                    radius: 15,
                    fillcolor: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.bottomNavigation
                        : R.colors.ghostWhite,
                    borderColor: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.bottomNavigation
                        : R.colors.ghostWhite,
                    prefixIcon: Image.asset(
                      R.images.edit,
                      scale: 3.5,
                    ),
                    textStyle: R.textStyle.bentonSansRegularRegular(
                        FontWeight.w400,
                        11.sp,
                        TextDecoration.none,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white.withOpacity(.8)
                            : R.colors.darkGray.withOpacity(.3)),
                  ),
                  obscureText: false),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 2.h,
                ),
                MyButton(
                  title: LocalizationMap.getValues('submit'),
                  onpress: () {
                    setState(() {
                      if (currentindex >= 3) {
                        Get.offNamed(VoucherScreen.route);
                      }
                      currentindex++;
                    });
                  },
                  height: 7.7.h,
                  width: 65.w,
                ),
                SizedBox(
                  width: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(VoucherScreen.route);
                  },
                  child: Container(
                    height: 7.7.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.bottomNavigation
                            : R.colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        LocalizationMap.getValues('skip'),
                        style: R.textStyle.bentonSansBold(FontWeight.w400,
                            11.sp, TextDecoration.none, R.colors.tealGreen),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget myContainer() {
    return Container(
      height: 22.h,
      width: 30.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            129.5,
          ),
          border: Border.all(width: 7, color: R.colors.tealGreen)),
      child: Center(
        child: Image.asset(
          R.images.vegan,
          height: 15.h,
          width: 35.w,
        ),
      ),
    );
  }
}
