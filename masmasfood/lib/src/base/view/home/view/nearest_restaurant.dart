import 'package:flutter/material.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';

class NearestRestaurant extends StatefulWidget {
  static String route = "/popular_restaurant";
  const NearestRestaurant({super.key});

  @override
  State<NearestRestaurant> createState() => _NearestRestaurantState();
}

class _NearestRestaurantState extends State<NearestRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 50.h,
            width: 100.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.images.hotel), fit: BoxFit.cover)),
          ),
          CustomScrollView(
            anchor: 0.4,
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.bottomSheet
                          : R.colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(left: 7.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Center(
                          child: Container(
                            height: 1.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.creamColor.withOpacity(.1)
                                    : R.colors.creamColor,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            popularButton(R.colors.tealGreen.withOpacity(.1),
                                R.colors.pineGreen.withOpacity(.1)),
                            SizedBox(
                              width: 44.w,
                            ),
                            myContainer(
                                R.colors.tealGreen.withOpacity(.1),
                                R.colors.pineGreen.withOpacity(.1),
                                R.images.locationicon),
                            SizedBox(
                              width: 3.w,
                            ),
                            myContainer(R.colors.red.withOpacity(.1),
                                R.colors.red.withOpacity(.1), R.images.heart)
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Wijie Bar and Resto',
                          style: R.textStyle.bentonSansBold(
                              FontWeight.w400,
                              22.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.obsidianShard),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            commonRow(
                                R.images.locationicon,
                                '19km',
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white.withOpacity(.3)
                                    : R.colors.darkGray.withOpacity(.3)),
                            SizedBox(
                              width: 2.w,
                            ),
                            commonRow(
                                R.images.star,
                                '4,8 Rating',
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white.withOpacity(.3)
                                    : R.colors.darkGray.withOpacity(.3)),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Most whole Alaskan Red King Crabs get broken down into \nlegs, claws, and lump meat. We offer all of these options \nas well in our online shop, but there is nothing like getting \nthe whole . . . .',
                          style: R.textStyle.bentonSansBook(
                              FontWeight.w400,
                              10.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.black),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 0.w,
                            ),
                            Text(LocalizationMap.getValues('popular_menu'),
                                style: R.textStyle.bentonSansBold(
                                    FontWeight.w400,
                                    11.9.sp,
                                    TextDecoration.none,
                                    Constant.themeMode == "ThemeMode.dark"
                                        ? R.colors.white
                                        : R.colors.obsidianShard)),
                            SizedBox(
                              width: 40.w,
                            ),
                            Text(LocalizationMap.getValues('view_all'),
                                style: R.textStyle.bentonSansBook(
                                    FontWeight.w400,
                                    9.5.sp,
                                    TextDecoration.none,
                                    R.colors.lightOrange)),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 0.w,
                              ),
                              popularMenu(
                                  R.images.pizza,
                                  'Spacy fresh crab',
                                  '12 \$',
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.bottomNavigation
                                      : R.colors.white,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white
                                      : R.colors.obsidianShard,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white.withOpacity(.5)
                                      : R.colors.obsidianShard.withOpacity(.5)),
                              SizedBox(
                                width: 6.w,
                              ),
                              popularMenu(
                                  R.images.chicken,
                                  'Spacy fresh crab',
                                  '16 \$',
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.bottomNavigation
                                      : R.colors.white,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white
                                      : R.colors.obsidianShard,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white.withOpacity(.5)
                                      : R.colors.obsidianShard.withOpacity(.5)),
                              SizedBox(
                                width: 6.w,
                              ),
                              popularMenu(
                                  R.images.pizza,
                                  'Spacy fresh crab',
                                  '16 \$',
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.bottomNavigation
                                      : R.colors.white,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white
                                      : R.colors.obsidianShard,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white.withOpacity(.5)
                                      : R.colors.obsidianShard.withOpacity(.5))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          LocalizationMap.getValues('testimonials'),
                          style: R.textStyle.bentonSansBold(
                              FontWeight.w400,
                              12.sp,
                              TextDecoration.none,
                              R.colors.obsidianShard),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Center(
                          child: myTestimonials(
                              R.images.girl,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.bottomNavigation
                                  : R.colors.white,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.obsidianShard,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.3)
                                  : R.colors.darkGray.withOpacity(.3),
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.black),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Center(
                          child: myTestimonials(
                              R.images.girl,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.bottomNavigation
                                  : R.colors.white,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.obsidianShard,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.3)
                                  : R.colors.darkGray.withOpacity(.3),
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.black),
                        )
                      ],
                    ),
                  ),
                );
              }, childCount: 1))
            ],
          ),
        ],
      ),
    );
  }

  Widget popularButton(Color colorone, Color colortwo) {
    return Container(
      height: 4.h,
      width: 19.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.5),
          gradient: LinearGradient(colors: [colorone, colortwo])),
      child: Center(
        child: Text(
          LocalizationMap.getValues('popular'),
          style: R.textStyle.bentonSansMedium(
              FontWeight.w400, 10.sp, TextDecoration.none, R.colors.pineGreen),
        ),
      ),
    );
  }

  Widget myContainer(Color colorone, Color colortwo, String image) {
    return Container(
      height: 3.4.h,
      width: 8.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.5),
          gradient: LinearGradient(colors: [colorone, colortwo])),
      child: Center(
        child: Image.asset(
          image,
          height: 2.h,
          width: 7.w,
        ),
      ),
    );
  }

  Widget commonRow(String image, String text, Color textColor) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 2.5.h,
          width: 7.w,
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          text,
          style: R.textStyle.bentonSansRegularRegular(FontWeight.w400, 11.sp,
              TextDecoration.none, textColor //R.colors.darkGray.withOpacity(.3)
              ),
        )
      ],
    );
  }

  Widget popularMenu(String image, String text, String subtitle,
      Color containerColor, Color textColor, Color priceColor) {
    return Container(
      height: 20.h,
      width: 38.1.w,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
              color: R.colors.darkGray.withOpacity(.1),
              blurRadius: 0.5,
              spreadRadius: 0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 8.5.h,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            text,
            style: R.textStyle.bentonSansMedium(
                FontWeight.w400, 12.sp, TextDecoration.none, textColor),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            subtitle,
            style: R.textStyle.bentonSansBook(
                FontWeight.w400, 10.sp, TextDecoration.none, priceColor),
          )
        ],
      ),
    );
  }

  Widget myTestimonials(String image, Color containerColor, Color nameColor,
      Color dateColor, Color reviewColor) {
    return Container(
      height: 14.h,
      width: 90.w,
      padding: EdgeInsets.only(top: 2.h, left: 3.w),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
              color: R.colors.darkGray.withOpacity(.1),
              blurRadius: 0.5,
              spreadRadius: 0),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 7.h,
            width: 17.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dianne Russell',
                style: R.textStyle.bentonSansMedium(
                    FontWeight.w400, 12.sp, TextDecoration.none, nameColor),
              ),
              Text(
                '12 April 2021',
                textAlign: TextAlign.start,
                style: R.textStyle.googleFontRubik(
                    FontWeight.w400, 9.sp, TextDecoration.none, dateColor),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'This Is great, So delicious! You Must \nHere, With Your family . . ',
                style: R.textStyle.bentonSansBook(
                    FontWeight.w400, 9.sp, TextDecoration.none, reviewColor),
              ),
            ],
          ),
          Container(
            height: 3.3.h,
            width: 12.w,
            margin: EdgeInsets.only(right: 2.w, top: 1.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.5),
              gradient: LinearGradient(colors: [
                R.colors.tealGreen.withOpacity(.1),
                R.colors.pineGreen.withOpacity(.1)
              ]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  R.images.fullstar,
                  height: 2.5.h,
                  width: 5.w,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  '5',
                  style: R.textStyle.bentonSansBold(FontWeight.w400, 13.sp,
                      TextDecoration.none, R.colors.pineGreen),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
//R.colors.lightgreen, R.colors.greencolor
