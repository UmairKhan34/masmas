import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/home/view/filter_screen.dart';
import 'package:masmas/src/base/view/home/view/nearest_restaurant.dart';
import 'package:masmas/src/base/view/home/view/popular_view.dart';
import 'package:masmas/src/base/view/home/view/product_details.dart';
import 'package:masmas/src/base/view/home/view/view_more_screen.dart';

import 'package:masmas/src/base/view/home/view/widget/widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../view_model/base_vm.dart';
import 'popular_menu.dart';

class HomeScreenView extends StatefulWidget {
  static String route = "/homeview";
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  List<String> images = [
    R.images.promo,
    R.images.promo,
    R.images.promo,
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVM>(
        builder: (context, baseVm, child) => Scaffold(
            backgroundColor: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.profileScreen
                : R.colors.white.withOpacity(.01),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MyWidget(
                    onpress: () {
                      Get.toNamed(FilterScreen.route);
                    },
                  ),
                  SizedBox(
                    height: 2.2.h,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: Get.width,
                    child: PageView.builder(
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.1.w),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 2.2.h,
                  ),
                  commonRow(LocalizationMap.getValues('nearest_restaurant'),
                      LocalizationMap.getValues('view_more'), () {
                    Get.toNamed(PopularMenuDetails.route);
                  },
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(height: 22.h, child: restaurantList(baseVm)),
                  SizedBox(
                    height: 2.2.h,
                  ),
                  commonRow(LocalizationMap.getValues('popular_menu'),
                      LocalizationMap.getValues('view_more'), () {
                    Get.toNamed(PopularView.route);
                  },
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard),
                  SizedBox(
                    height: 2.2.h,
                  ),
                  SizedBox(height: 14.h, child: menuList(baseVm)),
                  commonRow(LocalizationMap.getValues('nearest_restaurant'),
                      LocalizationMap.getValues('view_more'), () {
                    Get.toNamed(ViewMore.route);
                  },
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(height: 22.h, child: restaurantList(baseVm)),
                  SizedBox(
                    height: 2.2.h,
                  ),
                ],
              ),
            )));
  }

  Widget menuList(BaseVM baseVm) {
    return ListView.builder(
        padding: EdgeInsets.only(left: 2.w),
        scrollDirection: Axis.horizontal,
        itemCount: baseVm.menuList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed(ProductDetails.route);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 11.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.bottomNavigation
                                : R.colors.white,
                            borderRadius: BorderRadius.circular(22)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 2.5.w,
                            ),
                            Image.asset(
                              baseVm.menuList[index].menuImage ?? "",
                              height: 7.3.h,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              baseVm.menuList[index].menuName ?? "",
                              style: R.textStyle.bentonSansBold(
                                FontWeight.w400,
                                11.5.sp,
                                TextDecoration.none,
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white
                                    : R.colors.obsidianShard,
                              ),
                            ),
                            SizedBox(
                              width: 9.h,
                            ),
                            Text(baseVm.menuList[index].menuPrice ?? "",
                                style: R.textStyle.bentonSansBold(
                                    FontWeight.w400,
                                    17.5.sp,
                                    TextDecoration.none,
                                    R.colors.yellow))
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          );
        });
  }

  Widget restaurantList(BaseVM baseVm) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: baseVm.restaurant.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(NearestRestaurant.route);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Container(
                  height: 22.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.bottomNavigation
                          : R.colors.white,
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        baseVm.restaurant[index].restaurantImage ?? '',
                        height: 73,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        baseVm.restaurant[index].restaurantName ?? '',
                        style: R.textStyle.bentonSansBold(
                          FontWeight.w400,
                          12.5.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white
                              : R.colors.obsidianShard,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        baseVm.restaurant[index].restaurantTime ?? '',
                        style: R.textStyle.bentonSansBook(
                          FontWeight.w400,
                          10.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white.withOpacity(.4)
                              : R.colors.obsidianShard.withOpacity(.5),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
  // Widget myContainer(String image, String text, String subtitle) {
  //   return InkWell(
  //     onTap: () {
  //       Get.toNamed(NearestRestaurant.route);
  //     },
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 6.w,
  //         ),
  //         Container(
  //           height: 22.h,
  //           width: 40.w,
  //           decoration: BoxDecoration(
  //               color: Colors.white, borderRadius: BorderRadius.circular(22)),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Image.asset(
  //                 image,
  //                 height: 73,
  //               ),
  //               SizedBox(
  //                 height: 3.h,
  //               ),
  //               Text(
  //                 text,
  //                 style: R.textStyle.bentonSansBold(FontWeight.w400, 12.5.sp,
  //                     TextDecoration.none, R.colors.obsidianShard),
  //               ),
  //               SizedBox(
  //                 height: 1.h,
  //               ),
  //               Text(
  //                 subtitle,
  //                 style: R.textStyle.bentonSansBook(
  //                     FontWeight.w400,
  //                     10.sp,
  //                     TextDecoration.none,
  //                     R.colors.obsidianShard.withOpacity(.5)),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget commonRow(
      String text, String subtitle, VoidCallback onpress, Color textColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: R.textStyle.bentonSansBold(
                  FontWeight.w400, 11.9.sp, TextDecoration.none, textColor)),
          InkWell(
            onTap: onpress,
            child: Text(subtitle,
                style: R.textStyle.bentonSansBook(FontWeight.w400, 9.5.sp,
                    TextDecoration.none, R.colors.lightOrange)),
          ),
        ],
      ),
    );
  }
  // Widget secondContainer(String image, String text, String subtitle) {
  //   return Row(
  //     children: [
  //       SizedBox(
  //         width: 5.w,
  //       ),
  //       Container(
  //         height: 11.h,
  //         width: 90.w,
  //         decoration: BoxDecoration(
  //             color: Colors.white, borderRadius: BorderRadius.circular(22)),
  //         child: Row(
  //           children: [
  //             SizedBox(
  //               width: 2.5.w,
  //             ),
  //             Image.asset(
  //               image,
  //               height: 7.3.h,
  //             ),
  //             SizedBox(
  //               width: 7.w,
  //             ),
  //             Text(
  //               text,
  //               style: R.textStyle.bentonSansBold(FontWeight.w400, 11.5.sp,
  //                   TextDecoration.none, R.colors.obsidianShard),
  //             ),
  //             SizedBox(
  //               width: 7.h,
  //             ),
  //             Text(subtitle,
  //                 style: R.textStyle.bentonSansBold(FontWeight.w400, 17.5.sp,
  //                     TextDecoration.none, R.colors.yellow))
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
