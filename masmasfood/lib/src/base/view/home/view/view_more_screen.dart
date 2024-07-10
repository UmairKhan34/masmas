import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/base/view/home/view/filter_screen.dart';
import 'package:masmas/src/base/view/home/view/widget/widget.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';

class ViewMore extends StatefulWidget {
  static String route = "/viewMore";
  const ViewMore({super.key});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVM>(
        builder: (context, baseVm, child) => Scaffold(
              backgroundColor: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.profileScreen
                  : R.colors.white,
              body: Column(
                children: [
                  MyWidget(
                    onpress: () {
                      Get.toNamed(FilterScreen.route);
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 4.7.w,
                      ),
                      Text(
                        LocalizationMap.getValues('popular_restaurant'),
                        style: R.textStyle.bentonSansBold(FontWeight.w400,
                            12.sp, TextDecoration.none, R.colors.obsidianShard),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: baseVm.restaurant.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 52.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              color: Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.1)
                                  : R.colors.whiteSmoke,
                              borderRadius: BorderRadius.circular(22)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                baseVm.restaurant[index].restaurantImage ?? '',
                                height: 8.h,
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Text(
                                baseVm.restaurant[index].restaurantName ?? '',
                                style: R.textStyle.bentonSansBold(
                                  FontWeight.w400,
                                  13.sp,
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
                                    11.sp,
                                    TextDecoration.none,
                                    Constant.themeMode == "ThemeMode.dark"
                                        ? R.colors.white.withOpacity(.5)
                                        : R.colors.obsidianShard
                                            .withOpacity(.5)),
                              )
                            ],
                          ),
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.h,
                          crossAxisSpacing: 5.5.w),
                    ),
                  ),
                ],
              ),
            ));
  }
}
