import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/base/view/home/view/filter_screen.dart';
import 'package:masmas/src/base/view/home/view/widget/widget.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:masmas/utilis/button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';

class ProductDetails extends StatefulWidget {
  static String route = "/product_details";
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
                    height: 3.h,
                  ),
                  Expanded(child: productList(baseVm)),
                  MyButton(
                    title: LocalizationMap.getValues('check_out'),
                    onpress: () {},
                    width: 82.w,
                    height: 7.5.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ));
  }

  Widget productList(BaseVM baseVm) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        itemCount: baseVm.productList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 14.h,
            width: 90.w,
            margin: EdgeInsets.only(top: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.bottomNavigation
                  : R.colors.white,
              boxShadow: [
                BoxShadow(
                  color: R.colors.darkGray.withOpacity(.1),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(
                  baseVm.productList[index].productImage ?? '',
                  height: 9.2.h,
                  width: 17.w,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Text(
                      baseVm.productList[index].productName ?? '',
                      style: R.textStyle.bentonSansMedium(
                          FontWeight.w400,
                          12.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white
                              : R.colors.obsidianShard),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      baseVm.productList[index].productDescription ?? '',
                      style: R.textStyle.bentonSansRegularRegular(
                          FontWeight.w400,
                          11.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white.withOpacity(.3)
                              : R.colors.darkGray.withOpacity(.3)),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Text(
                      '${baseVm.productList[index].productPrice} \$',
                      style: R.textStyle.bentonSansMedium(FontWeight.w400,
                          15.sp, TextDecoration.none, R.colors.pineGreen),
                    ),
                  ],
                ),
                SizedBox(
                  width: 6.w,
                ),
                cartButton(
                  R.colors.tealGreen,
                  R.colors.pineGreen,
                  () {
                    if (baseVm.selectedItemList.contains(index)) {
                      baseVm.removeCart(baseVm.productList[index]);
                      baseVm.selectedItemList.remove(index);
                    } else {
                      if (baseVm.cartItemsList.isEmpty) {
                        baseVm.addCart(baseVm.productList[index]);
                      } else {
                        bool isProductCart = false;
                        for (var element in baseVm.cartItemsList) {
                          if (element.productId ==
                              baseVm.productList[index].productId) {
                            isProductCart = true;
                            break;
                          }
                        }
                        if (!isProductCart) {
                          baseVm.addCart(baseVm.productList[index]);
                        } else {
                          debugPrint("Item already exists in the cart.");
                        }
                      }
                      if (!baseVm.selectedItemList.contains(index)) {
                        baseVm.selectedItemList.add(index);
                      }
                    }
                  },
                  baseVm.selectedItemList.contains(index)
                      ? 'added'
                      : 'add_to_cart',
                )
              ],
            ),
          );
        });
  }

  Widget cartButton(
      Color colorone, Color colorTwo, VoidCallback onPress, String buttonText) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 4.4.h,
        width: 26.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.5),
          gradient: LinearGradient(colors: [colorone, colorTwo]),
        ),
        child: Center(
            child: Text(LocalizationMap.getValues(buttonText),
                style: R.textStyle.bentonSansBold(FontWeight.w400, 10.sp,
                    TextDecoration.none, R.colors.white))),
      ),
    );
  }
}
