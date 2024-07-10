// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';

import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/view/home/view/widget/widget.dart';
import 'package:masmas/utilis/button.dart';

import 'package:sizer/sizer.dart';

import '../../../../../constants/enum.dart';

class FilterScreen extends StatefulWidget {
  static String route = '/filterscreen';
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int isSelected = 0;
  TypeChoice selectedChoice = TypeChoice.restaurant;
  LocationChoice locationChoice = LocationChoice.onekm;
  FoodChoice foodChoice = FoodChoice.cake;
  void handleChoiceChange(TypeChoice choice) {
    setState(() {
      selectedChoice = choice;
    });
  }

  void handlelocationChoice(LocationChoice choice) {
    setState(() {
      locationChoice = choice;
    });
  }

  void handlefoodChoice(FoodChoice choice) {
    setState(() {
      foodChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white.withOpacity(.01),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyWidget(
              onpress: () {
                Get.back();
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  LocalizationMap.getValues('type'),
                  style: TextStyle(
                      fontFamily: 'BentonSans Bold',
                      fontSize: 15,
                      color: R.colors.obsidianShard),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                myContainer(
                    6.h, 29.2.w, 'Restaurant', 0, TypeChoice.restaurant),
                SizedBox(
                  width: 5.w,
                ),
                myContainer(5.7.h, 21.2.w, 'Menu', 1, TypeChoice.menu)
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  LocalizationMap.getValues('location'),
                  style: TextStyle(
                      fontFamily: 'BentonSans Bold',
                      fontSize: 15,
                      color: R.colors.obsidianShard),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                myLocation(5.7.h, 21.2.w, '1 km', 2, LocationChoice.onekm),
                SizedBox(
                  width: 3.w,
                ),
                myLocation(5.7.h, 23.1.w, '>10 km', 3, LocationChoice.less10km),
                SizedBox(
                  width: 3.w,
                ),
                myLocation(
                    5.7.h, 23.1.w, '<10 km', 4, LocationChoice.greater10km)
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  LocalizationMap.getValues('food'),
                  style: TextStyle(
                      fontFamily: 'BentonSans Bold',
                      fontSize: 15,
                      color: R.colors.obsidianShard),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                myFood(5.3.h, 21.2.w, 'Cake', 5, FoodChoice.cake),
                SizedBox(
                  width: 3.w,
                ),
                myFood(5.3.h, 21.2.w, 'Soup', 6, FoodChoice.soup),
                SizedBox(
                  width: 3.w,
                ),
                myFood(5.7.h, 31.1.w, 'Main Course', 7, FoodChoice.maincourse)
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                myFood(5.3.h, 31.2.w, 'Appetizer', 8, FoodChoice.appetizer),
                SizedBox(
                  width: 3.w,
                ),
                myFood(5.7.h, 24.1.w, 'Dessert', 9, FoodChoice.dessert)
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Center(
              child: MyButton(
                title: LocalizationMap.getValues('search'),
                onpress: () {},
                height: 7.h,
                width: 90.w,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myContainer(
      double height, double width, String text, int index, TypeChoice choice) {
    final isSelected = selectedChoice == choice;
    return GestureDetector(
      onTap: () {
        setState(() {
          {
            handleChoiceChange(choice);
          }
        });
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? Colors.orange : R.colors.yellow.withOpacity(.10),
          ),
          borderRadius: BorderRadius.circular(15),
          color: R.colors.yellow.withOpacity(.10),
        ),
        child: Center(
          child: Text(
            text,
            style: R.textStyle.bentonSansMedium(
                FontWeight.w400, 9.5.sp, TextDecoration.none, R.colors.orange),
          ),
        ),
      ),
    );
  }

  Widget myLocation(double height, double width, String text, int index,
      LocationChoice choice) {
    final isSelected = locationChoice == choice;
    return GestureDetector(
      onTap: () {
        setState(() {
          {
            handlelocationChoice(choice);
          }
        });
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? Colors.orange : R.colors.yellow.withOpacity(.10),
          ),
          borderRadius: BorderRadius.circular(15),
          color: R.colors.yellow.withOpacity(.10),
        ),
        child: Center(
          child: Text(
            text,
            style: R.textStyle.bentonSansMedium(
                FontWeight.w400, 9.5.sp, TextDecoration.none, R.colors.orange),
          ),
        ),
      ),
    );
  }

  Widget myFood(
      double height, double width, String text, int index, FoodChoice choice) {
    final isSelected = foodChoice == choice;
    return GestureDetector(
      onTap: () {
        setState(() {
          {
            handlefoodChoice(choice);
          }
        });
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? Colors.orange : R.colors.yellow.withOpacity(.10),
          ),
          borderRadius: BorderRadius.circular(15),
          color: R.colors.yellow.withOpacity(.10),
        ),
        child: Center(
          child: Text(
            text,
            style: R.textStyle.bentonSansMedium(
                FontWeight.w400, 9.5.sp, TextDecoration.none, R.colors.orange),
          ),
        ),
      ),
    );
  }
}
