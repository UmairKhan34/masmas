// ignore_for_file: unused_import, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/services/hive_db.dart';
import 'package:masmas/src/auth/view_model/auth_vm.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/app_localization.dart';
import '../../../../../utilis/field_validations.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  bool _isSearching = false;
  bool _isMoving = false;
  HiveDb db = HiveDb();
  TextEditingController nameController = TextEditingController();
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    initializeLanguage();
  }

  void initializeLanguage() async {
    String? language = await HiveDb.getLanguage();
    if (language != null && language == 'ar') {
      setState(() {
        _isMoving = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BaseVM>(
      context,
    );
    return Consumer<AuthVM>(
        builder: (context, authVm, child) => Scaffold(
              body: Stack(
                children: [
                  Container(
                    height: 50.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(R.images.personal),
                            fit: BoxFit.cover)),
                  ),
                  CustomScrollView(
                    anchor: 0.52,
                    slivers: [
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22)),
                            color: provider.themeMode == ThemeMode.dark
                                ? R.colors.profileScreen
                                : R.colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Center(
                                child: Container(
                                  height: 0.5.h,
                                  width: 18.w,
                                  decoration: BoxDecoration(
                                      color:
                                          provider.themeMode == ThemeMode.dark
                                              ? R.colors.bottomNavigation
                                              : R.colors.creamColor,
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5.5.h,
                                    width: 35.w,
                                    margin: EdgeInsets.only(left: 3.w),
                                    decoration: BoxDecoration(
                                        color: R.colors.yellow.withOpacity(.05),
                                        borderRadius:
                                            BorderRadius.circular(18.5)),
                                    child: Center(
                                      child: Text(
                                        LocalizationMap.getValues(
                                            'member_gold'),
                                        style: R.textStyle.bentonSansMedium(
                                            FontWeight.w400,
                                            9.sp,
                                            TextDecoration.none,
                                            R.colors.yellow),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Switch(
                                      activeColor: R.colors.gray,
                                      activeTrackColor: R.colors.ghostWhite,
                                      inactiveThumbColor: R.colors.ghostWhite,
                                      splashRadius: 50.0,
                                      value: _isMoving,
                                      onChanged: (value) async {
                                        _isMoving = value;
                                        if (_isMoving) {
                                          Constant.language = 'ar';
                                        } else {
                                          Constant.language = 'en';
                                        }
                                        setState(() {});
                                        print('$value');
                                        await db.setLanguage(
                                            Constant.language ?? "");
                                        String? lan =
                                            await HiveDb.getLanguage();
                                        print("--- $lan");
                                      }),
                                  ElevatedButton(
                                      onPressed: () async {
                                        provider.toggleTheme();

                                        await db.setThemeMode(
                                            Constant.themeMode ?? "");
                                      },
                                      child: const Center(
                                        child: Text('Change App theme'),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: _isSearching
                                    ? TextFormField(
                                        textCapitalization:
                                            TextCapitalization.words,
                                        validator: (value) {
                                          return FieldValidation
                                              .validateUserName(value);
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        onTapOutside: (event) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        controller: nameController,
                                        maxLength: 16,
                                        keyboardType: TextInputType.name,
                                        decoration: R.fieldDecoration
                                            .decoration(
                                                hint: LocalizationMap.getValues(
                                                    'anamwp'),
                                                radius: 15,
                                                fillcolor: R.colors.ghostWhite,
                                                borderColor:
                                                    R.colors.ghostWhite,
                                                suffixIcon: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _isSearching =
                                                            !_isSearching;
                                                      });
                                                      authVm.addUserName(
                                                          nameController.text);
                                                      print(authVm
                                                          .user.last.name);
                                                      authVm.update();
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                        Icons.send))),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            authVm.user.last.name ??
                                                "Enter name",
                                            style: R.textStyle.bentonSansBold(
                                                FontWeight.w400,
                                                23.sp,
                                                TextDecoration.none,
                                                provider.themeMode ==
                                                        ThemeMode.dark
                                                    ? R.colors.white
                                                    : R.colors.obsidianShard),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _isSearching = !_isSearching;
                                              });
                                            },
                                            child: Image.asset(
                                              R.images.pen,
                                              height: 2.8.h,
                                              width: 8.4.w,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                              SizedBox(
                                height: 0.9.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    authVm.user[index].email.toString(),
                                    style: R.textStyle.bentonSansRegularRegular(
                                        FontWeight.w400,
                                        11.sp,
                                        TextDecoration.none,
                                        provider.themeMode == ThemeMode.dark
                                            ? R.colors.white.withOpacity(.3)
                                            : R.colors.obsidianShard
                                                .withOpacity(.3)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Center(
                                child: Container(
                                  width: 90.w,
                                  height: 6.4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: provider.themeMode == ThemeMode.dark
                                        ? R.colors.bottomNavigation
                                        : R.colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            provider.themeMode == ThemeMode.dark
                                                ? R.colors.darkGray
                                                : R.colors.darkGray,
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Image.asset(
                                        R.images.vouchericon,
                                        height: 4.3.h,
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: LocalizationMap.getValues(
                                              "you_have"),
                                          style: R.textStyle.bentonSansMedium(
                                            FontWeight.w400,
                                            12.sp,
                                            TextDecoration.none,
                                            provider.themeMode == ThemeMode.dark
                                                ? R.colors.white
                                                : R.colors.obsidianShard,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 3',
                                          style: R.textStyle.bentonSansMedium(
                                            FontWeight.w400,
                                            12.sp,
                                            TextDecoration.none,
                                            provider.themeMode == ThemeMode.dark
                                                ? R.colors.white
                                                : R.colors.obsidianShard,
                                          ),
                                        ),
                                        TextSpan(
                                          text: LocalizationMap.getValues(
                                              "voucher"),
                                          style: R.textStyle.bentonSansMedium(
                                            FontWeight.w400,
                                            12.sp,
                                            TextDecoration.none,
                                            provider.themeMode == ThemeMode.dark
                                                ? R.colors.white
                                                : R.colors.obsidianShard,
                                          ),
                                        ),
                                      ]))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    LocalizationMap.getValues('favorite'),
                                    style: R.textStyle.bentonSansBold(
                                      FontWeight.w400,
                                      12.sp,
                                      TextDecoration.none,
                                      provider.themeMode == ThemeMode.dark
                                          ? R.colors.white
                                          : R.colors.obsidianShard,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Center(
                                  child: mycontainer(
                                R.images.pasta,
                                'Spacy fresh crab',
                                'Waroenk kita',
                                '\$ 35',
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.bottomNavigation
                                    : R.colors.white,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.bottomNavigation
                                    : R.colors.white,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.white
                                    : R.colors.obsidianShard,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.white.withOpacity(.3)
                                    : R.colors.obsidianShard.withOpacity(.3),
                              )),
                              SizedBox(
                                height: 6.w,
                              ),
                              Center(
                                  child: mycontainer(
                                R.images.menuphoto,
                                'Spacy fresh crab',
                                'Waroenk kita',
                                '\$ 35',
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.bottomNavigation
                                    : R.colors.white,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.bottomNavigation
                                    : R.colors.white,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.white
                                    : R.colors.obsidianShard,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.white.withOpacity(.3)
                                    : R.colors.obsidianShard.withOpacity(.3),
                              )),
                              SizedBox(
                                height: 6.w,
                              ),
                              Center(
                                  child: mycontainer(
                                R.images.icecream,
                                'Spacy fresh crab',
                                'Waroenk kita',
                                '\$ 35',
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.bottomNavigation
                                    : R.colors.white,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.bottomNavigation
                                    : R.colors.white,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.white
                                    : R.colors.obsidianShard,
                                provider.themeMode == ThemeMode.dark
                                    ? R.colors.white.withOpacity(.3)
                                    : R.colors.obsidianShard.withOpacity(.3),
                              )),
                              SizedBox(
                                height: 6.w,
                              ),
                            ],
                          ),
                        );
                      }, childCount: 1))
                    ],
                  ),
                ],
              ),
            ));
  }

  Widget mycontainer(
      String image,
      String text,
      String subtitle,
      String dollar,
      Color containerColor,
      Color blurColor,
      Color textColor,
      Color subtitleColor) {
    return Container(
      height: 12.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: blurColor,
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 3.w,
          ),
          Image.asset(
            image,
            height: 8.2.h,
            width: 15.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                text,
                style: R.textStyle.bentonSansMedium(
                    FontWeight.w400, 12.sp, TextDecoration.none, textColor),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                subtitle,
                style: R.textStyle.bentonSansRegularRegular(
                    FontWeight.w400, 11.sp, TextDecoration.none, subtitleColor),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                dollar,
                style: R.textStyle.bentonSansMedium(FontWeight.w400, 15.sp,
                    TextDecoration.none, R.colors.pineGreen),
              ),
            ],
          ),
          SizedBox(
            width: 6.w,
          ),
          myButton()
        ],
      ),
    );
  }

  Widget myButton() {
    return Container(
      height: 4.4.h,
      width: 26.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.5),
        gradient:
            LinearGradient(colors: [R.colors.tealGreen, R.colors.pineGreen]),
      ),
      child: Center(
          child: Text(LocalizationMap.getValues('buy_again'),
              style: R.textStyle.bentonSansBold(FontWeight.w400, 10.sp,
                  TextDecoration.none, R.colors.white))),
    );
  }
}
