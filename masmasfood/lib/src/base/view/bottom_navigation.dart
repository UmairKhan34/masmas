// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/cart/view/cart_view.dart';
import 'package:masmas/src/base/view/chat/view/chat_view.dart';
import 'package:masmas/src/base/view/profile/view/profile_view.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:masmas/utilis/toast_message/toast_message.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'home/view/home_view.dart';

class BottomNavigation extends StatefulWidget {
  static String route = "/bottomnavigation";
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List _pages = [
    const HomeScreenView(),
    const ProfileScreenView(),
    const CartView(),
    const ChatView(),
  ];
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onBackButtonDoubleClicked(context),
        child: Consumer<BaseVM>(
          builder: (context, baseVm, child) => Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.5.h),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              height: 12.h,
              width: 85.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.bottomNavigation
                    : R.colors.white,
              ),
              child: GNav(
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                gap: 8,
                backgroundColor: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.bottomNavigation
                    : R.colors.white,
                textStyle: R.textStyle.bentonSansMedium(FontWeight.w400, 11.sp,
                    TextDecoration.none, R.colors.obsidianShard),
                tabs: [
                  GButton(
                    icon: Icons.abc,
                    backgroundColor: Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(12),
                    leading: Image.asset(
                      R.images.home,
                      width: 8.w,
                      height: 3.h,
                    ),
                    textStyle: R.textStyle.bentonSansMedium(
                      FontWeight.w400,
                      10.sp,
                      TextDecoration.none,
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard,
                    ),
                    text: LocalizationMap.getValues(
                      'home',
                    ),
                  ),
                  GButton(
                    icon: Icons.abc,
                    backgroundColor: Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(12),
                    leading: Image.asset(
                      R.images.profile,
                      width: 8.w,
                      height: 3.h,
                    ),
                    textStyle: R.textStyle.bentonSansMedium(
                      FontWeight.w400,
                      10.sp,
                      TextDecoration.none,
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard,
                    ),
                    text: LocalizationMap.getValues('profile'),
                  ),
                  GButton(
                    icon: Icons.abc,
                    backgroundColor: Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(12),
                    leading: baseVm.cartItemCount > 0
                        ? Badge(
                            alignment: Alignment.topRight,
                            label: Text(
                              baseVm.cartItemCount.toString(),
                              textAlign: TextAlign.center,
                              style: R.textStyle.bentonSansBold(
                                FontWeight.w400,
                                7.sp,
                                TextDecoration.none,
                                R.colors.white,
                              ),
                            ),
                            backgroundColor: R.colors.bloodBurst,
                            child: Image.asset(
                              R.images.cart,
                              width: 8.w,
                              height: 3.h,
                            ),
                          )
                        : Image.asset(
                            R.images.cart,
                            width: 8.w,
                            height: 3.h,
                          ),
                    textStyle: R.textStyle.bentonSansMedium(
                      FontWeight.w400,
                      10.sp,
                      TextDecoration.none,
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard,
                    ),
                    text: LocalizationMap.getValues('cart'),
                  ),
                  GButton(
                    icon: Icons.abc,
                    backgroundColor: Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(12),
                    leading: Image.asset(
                      R.images.chatIcon,
                      width: 8.w,
                      height: 3.h,
                    ),
                    textStyle: R.textStyle.bentonSansMedium(
                      FontWeight.w400,
                      10.sp,
                      TextDecoration.none,
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white
                          : R.colors.obsidianShard,
                    ),
                    text: LocalizationMap.getValues('chat'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _onBackButtonDoubleClicked(BuildContext context) async {
    final difference = DateTime.now().difference(timeBackPressed);
    timeBackPressed = DateTime.now();
    if (difference >= const Duration(seconds: 2)) {
      ToastMessage.toastMessage(
          LocalizationMap.getValues('press_again_to_exit'), R.colors.black);
      return false;
    } else {
      SystemNavigator.pop(animated: true);
      return true;
    }
  }
}
