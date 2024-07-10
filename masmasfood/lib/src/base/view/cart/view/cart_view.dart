import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/cart/view/edit_payment_screen.dart';
import 'package:masmas/src/base/view/cart/view/location_screen.dart';
import 'package:masmas/src/base/view/cart/view/widget/button_widget.dart';
import 'package:masmas/src/base/view/chat/view/widget/common_widget.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/app_localization.dart';

class CartView extends StatefulWidget {
  static String route = "/cart_view";
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int value = 1;
  int currentindex = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVM>(
        builder: (context, baseVm, child) => Scaffold(
              backgroundColor: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.profileScreen
                  : R.colors.white.withOpacity(.01),
              body: baseVm.cartItemsList.isEmpty
                  ? Center(
                      child: Text(
                        'Cart is Empty ',
                        style: R.textStyle.bentonSansBold(
                          FontWeight.w400,
                          20.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white
                              : R.colors.black,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        CommonWidget(
                          image: R.images.patternBack,
                          text: currentindex == 1
                              ? LocalizationMap.getValues('order_details')
                              : LocalizationMap.getValues('confirm_order'),
                          height: 18.9.h,
                          onpress: () {},
                        ),
                        SizedBox(height: 1.7.h),
                        Expanded(
                          child: currentindex == 1
                              ? SizedBox(
                                  height: 40.h,
                                  child: SlidableAutoCloseBehavior(
                                      child: cartList(baseVm)),
                                )
                              : Column(
                                  children: [
                                    confirmOrder(
                                        Constant.themeMode == "ThemeMode.dark"
                                            ? R.colors.bottomNavigation
                                            : R.colors.white,
                                        '4517 Washington Ave. Manchester, \nKentucky 39495',
                                        5.h,
                                        9.w,
                                        LocalizationMap.getValues('deliver_to'),
                                        R.images.location,
                                        13.h,
                                        LocalizationMap.getValues('edit'), () {
                                      Get.toNamed(LocationScreenView.route);
                                    },
                                        90.w,
                                        R.textStyle.bentonSansRegularRegular(
                                            FontWeight.w400,
                                            11.sp,
                                            TextDecoration.none,
                                            Constant.themeMode ==
                                                    "ThemeMode.dark"
                                                ? R.colors.white.withOpacity(.3)
                                                : R.colors.darkGray
                                                    .withOpacity(.3)),
                                        R.textStyle.bentonSansMedium(
                                            FontWeight.w400,
                                            12.sp,
                                            TextDecoration.none,
                                            Constant.themeMode ==
                                                    "ThemeMode.dark"
                                                ? R.colors.white
                                                : R.colors.obsidianShard)),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    confirmOrder(
                                        Constant.themeMode == "ThemeMode.dark"
                                            ? R.colors.bottomNavigation
                                            : R.colors.white,
                                        '2121 6352 8465 ****',
                                        6.h,
                                        25.w,
                                        LocalizationMap.getValues(
                                            'payment_method'),
                                        R.images.paypal,
                                        12.h,
                                        LocalizationMap.getValues('edit'), () {
                                      Get.toNamed(EditPaymentScreen.route);
                                    },
                                        90.w,
                                        R.textStyle.bentonSansRegularRegular(
                                            FontWeight.w400,
                                            11.sp,
                                            TextDecoration.none,
                                            Constant.themeMode ==
                                                    "ThemeMode.dark"
                                                ? R.colors.white.withOpacity(.3)
                                                : R.colors.darkGray
                                                    .withOpacity(.3)),
                                        R.textStyle.bentonSansRegularRegular(
                                            FontWeight.w400,
                                            11.sp,
                                            TextDecoration.none,
                                            Constant.themeMode ==
                                                    "ThemeMode.dark"
                                                ? R.colors.white
                                                : R.colors.darkGray))
                                  ],
                                ),
                        ),
                        Container(
                            width: 93.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    R.images.background,
                                  ),
                                  opacity: 0.55),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                R.colors.tealGreen,
                                R.colors.pineGreen
                              ]),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                chargesWidget(
                                    LocalizationMap.getValues('sub_total'),
                                    baseVm.updateSubTotal().toString(),
                                    R.textStyle.bentonSansMedium(
                                        FontWeight.w400,
                                        11.sp,
                                        TextDecoration.none,
                                        R.colors.snowColor)),
                                chargesWidget(
                                    LocalizationMap.getValues(
                                        'delivery_charge'),
                                    '10 \$',
                                    R.textStyle.bentonSansMedium(
                                        FontWeight.w400,
                                        11.sp,
                                        TextDecoration.none,
                                        R.colors.snowColor)),
                                chargesWidget(
                                    LocalizationMap.getValues('discount'),
                                    '20 \$',
                                    R.textStyle.bentonSansMedium(
                                        FontWeight.w400,
                                        11.sp,
                                        TextDecoration.none,
                                        R.colors.snowColor)),
                                chargesWidget(
                                    LocalizationMap.getValues('total'),
                                    baseVm.updateTotal().toString(),
                                    R.textStyle.bentonSansBold(
                                        FontWeight.w400,
                                        15.sp,
                                        TextDecoration.none,
                                        R.colors.snowColor)),
                                ButtonWidget(onpress: () {
                                  if (currentindex >= 2) {}
                                  currentindex++;
                                  setState(() {});
                                })
                              ],
                            ))
                      ],
                    ),
            ));
  }

  Widget cartList(BaseVM baseVm) {
    return ListView.builder(
        itemCount: baseVm.cartItemsList.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(left: 5.w, bottom: 3.h),
              height: 12.3.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.bottomNavigation
                    : R.colors.white,
              ),
              child: Slidable(
                endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.2,
                    children: [
                      SlidableAction(
                        autoClose: true,
                        foregroundColor: R.colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            topRight: Radius.circular(22),
                            bottomRight: Radius.circular(22)),
                        onPressed: (context) {
                          log('Deleting items at index $index');
                          baseVm.cartItemsList.removeAt(index);
                          baseVm.update();
                        },
                        icon: Icons.delete,
                        backgroundColor: R.colors.yellow,
                      ),
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Image.asset(
                      baseVm.cartItemsList[index].productImage ?? "",
                      height: 9.2.h,
                      width: 16.2.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          baseVm.cartItemsList[index].productName ?? "",
                          style: R.textStyle.bentonSansMedium(
                              FontWeight.w400,
                              12.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white
                                  : R.colors.obsidianShard),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 0.3.h,
                        ),
                        Text(
                          baseVm.cartItemsList[index].productDescription ?? "",
                          style: R.textStyle.bentonSansRegularRegular(
                              FontWeight.w400,
                              11.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.3)
                                  : R.colors.darkGray.withOpacity(.3)),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          '${baseVm.cartItemsList[index].productPrice} \$',
                          style: R.textStyle.bentonSansBold(FontWeight.w400,
                              15.sp, TextDecoration.none, R.colors.pineGreen),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    quantityCauclate(
                        baseVm.productList[index].inCart.toString(),
                        baseVm,
                        index,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white
                            : R.colors.thamarBlack.withOpacity(.3))
                  ],
                ),
              ));
        });
  }

  Widget chargesWidget(
    String title,
    String subtitle,
    TextStyle style,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, top: 1.h),
          child: Text(title, style: style),
        ),
        Padding(
          padding: EdgeInsets.only(right: 6.w, top: 1.h),
          child: Text(subtitle, style: style),
        ),
      ],
    );
  }

  Widget commonButton(
      Color colorone, Color colortwo, VoidCallback onpress, Widget icon) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: 8.w,
        height: 3.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(colors: [colorone, colortwo]),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }

  Widget quantityCauclate(
      String title, BaseVM baseVM, int index, Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonButton(R.colors.tealGreen.withOpacity(.1),
            R.colors.pineGreen.withOpacity(.1), () {
          if (baseVM.cartItemsList[index].inCart > 0) {
            baseVM.cartItemsList[index].inCart--;

            baseVM.update();
          }
        },
            Icon(
              Icons.horizontal_rule,
              size: 2.h,
              color: R.colors.pineGreen,
            )),
        SizedBox(
          width: 3.w,
        ),
        Text(
          baseVM.productList[index].inCart.toString(),
          style: R.textStyle.googleFontPoppins(
              FontWeight.w500, 12.sp, TextDecoration.none, textColor),
        ),
        SizedBox(
          width: 3.w,
        ),
        commonButton(R.colors.tealGreen, R.colors.pineGreen, () {
          baseVM.productList[index].inCart++;

          baseVM.update();
        },
            Icon(
              Icons.add,
              size: 2.h,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget confirmOrder(
      Color containerColor,
      String title,
      double imageheight,
      double imagewidth,
      String subtitle,
      String image,
      double height,
      String buttontext,
      VoidCallback onpress,
      double width,
      TextStyle style,
      TextStyle textstyle) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.5.w),
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: containerColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                subtitle,
                style: style,
              ),
              TextButton(
                  onPressed: onpress,
                  child: Text(
                    buttontext,
                    style: R.textStyle.bentonSansRegularRegular(FontWeight.w400,
                        11.sp, TextDecoration.none, R.colors.pineGreen),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: imageheight,
                width: imagewidth,
              ),
              Text(
                title,
                style: textstyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
