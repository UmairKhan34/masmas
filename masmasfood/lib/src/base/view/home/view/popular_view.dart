import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';

import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/home/view/filter_screen.dart';
import 'package:masmas/src/base/view/home/view/widget/widget.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PopularView extends StatefulWidget {
  static String route = "/popular_menu";
  const PopularView({super.key});

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVM>(
        builder: (context, baseVm, child) => Scaffold(
              backgroundColor: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.profileScreen
                  : R.colors.white.withOpacity(.9),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    MyWidget(
                      onpress: () {
                        Get.toNamed(FilterScreen.route);
                      },
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.7.w,
                        ),
                        Text(
                          LocalizationMap.getValues('popular_restaurant'),
                          style: R.textStyle.bentonSansBold(
                              FontWeight.w400,
                              11.5.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.obsidianShard),
                        ),
                      ],
                    ),
                    SizedBox(height: 45.h, child: menuList(baseVm))
                  ],
                ),
              ),
            ));
  }

  Widget menuList(BaseVM baseVm) {
    return ListView.builder(
        reverse: true,
        itemCount: baseVm.menuList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 3.h),
              Row(
                children: [
                  SizedBox(width: 4.w),
                  Container(
                    width: 92.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.bottomNavigation
                            : R.colors.white),
                    child: Row(
                      children: [
                        SizedBox(width: 2.w),
                        Image.asset(
                          baseVm.menuList[index].menuImage ?? "",
                          height: 18.4.h,
                          width: 18.4.w,
                        ),
                        SizedBox(width: 1.w),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              baseVm.menuList[index].menuName ?? "",
                              style: R.textStyle.bentonSansMedium(
                                  FontWeight.w400,
                                  12.sp,
                                  TextDecoration.none,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white
                                      : R.colors.obsidianShard),
                            ),
                            subtitle: Text(
                              baseVm.menuList[index].menuSubtitle ?? "",
                              style: R.textStyle.bentonSansRegularRegular(
                                  FontWeight.w400,
                                  10.sp,
                                  TextDecoration.none,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white.withOpacity(.3)
                                      : R.colors.obsidianShard.withOpacity(.3)),
                            ),
                            trailing: Text(
                              baseVm.menuList[index].menuPrice ?? "",
                              style: R.textStyle.bentonSansBold(FontWeight.w400,
                                  18.sp, TextDecoration.none, R.colors.yellow),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
