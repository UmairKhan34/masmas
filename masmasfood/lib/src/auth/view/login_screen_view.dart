import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/src/auth/view/sign_up_view.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/auth/view_model/auth_vm.dart';
import 'package:masmas/src/base/view/bottom_navigation.dart';
import 'package:masmas/utilis/field_validations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../Utilis/Button.dart';
import 'forgot_view.dart';

class LoginScreen extends StatefulWidget {
  static String route = "/loginview";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailnode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordnode = FocusNode();
  bool _obsecuretext = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVM>(
      builder: (context, authVm, child) => Scaffold(
        backgroundColor: Constant.themeMode == "ThemeMode.dark"
            ? R.colors.profileScreen
            : R.colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Positioned(
                    child: Image.asset(
                  R.images.patternImage,
                  width: double.infinity,
                )),
                Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Image.asset(
                        R.images.logoimage,
                        height: 23.h,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        R.images.appNameImage,
                        width: 80.w,
                        height: 7.h,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      LocalizationMap.getValues('login_to_your_account'),
                      textAlign: TextAlign.center,
                      style: R.textStyle.bentonSansBold(
                          FontWeight.w400,
                          16.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white
                              : R.colors.obsidianShard),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: R.textStyle.bentonSansRegularRegular(
                          FontWeight.w400,
                          12.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white
                              : R.colors.black),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return FieldValidation.validateEmail(value);
                      },
                      controller: emailController,
                      focusNode: emailnode,
                      decoration: R.fieldDecoration.decoration(
                          textStyle: R.textStyle.bentonSansRegularRegular(
                              FontWeight.w400,
                              11.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.3)
                                  : R.colors.darkGray.withOpacity(.3)),
                          hint: LocalizationMap.getValues('email'),
                          radius: 15,
                          fillcolor: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white.withOpacity(.1)
                              : R.colors.white,
                          borderColor: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.black
                              : R.colors.ghostWhite.withOpacity(.9)),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      style: R.textStyle.bentonSansRegularRegular(
                          FontWeight.w400,
                          12.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white
                              : R.colors.black),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        return FieldValidation.validatePassword(value);
                      },
                      controller: passwordController,
                      focusNode: passwordnode,
                      obscureText: _obsecuretext,
                      obscuringCharacter: "*",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: R.fieldDecoration.decoration(
                          textStyle: R.textStyle.bentonSansRegularRegular(
                              FontWeight.w400,
                              11.sp,
                              TextDecoration.none,
                              Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.3)
                                  : R.colors.darkGray.withOpacity(.3)),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsecuretext = !_obsecuretext;
                                });
                              },
                              child: Icon(_obsecuretext
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off)),
                          hint: LocalizationMap.getValues('password'),
                          radius: 15,
                          fillcolor: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white.withOpacity(.1)
                              : R.colors.white,
                          borderColor: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.black
                              : R.colors.ghostWhite.withOpacity(.9)),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(LocalizationMap.getValues('or_continue_with'),
                        textAlign: TextAlign.center,
                        style: R.textStyle.bentonSansBold(
                            FontWeight.w400,
                            11.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 0.1.w,
                        ),
                        commonContainer(
                            'Facebook',
                            R.images.facebook,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.bottomNavigation
                                : R.colors.white),
                        SizedBox(
                          width: 3.w,
                        ),
                        commonContainer(
                            'Google',
                            R.images.google,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.bottomNavigation
                                : R.colors.white)
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(ForgotView.route);
                      },
                      child: Text(
                          LocalizationMap.getValues('forgot_your_password'),
                          style: R.textStyle.bentonSansMedium(
                              FontWeight.w400,
                              11.5.sp,
                              TextDecoration.underline,
                              R.colors.tealGreen)),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    MyButton(
                      width: 37.w,
                      height: 7.h,
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          authVm.addUserDetail(emailController.text);
                          Get.offAllNamed(BottomNavigation.route);
                        } else {
                          log('invalid');
                        }
                      },
                      title: LocalizationMap.getValues('login'),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(SignUpView.route);
                      },
                      child: Text(
                        LocalizationMap.getValues('create_an_account'),
                        style: R.textStyle.bentonSansMedium(
                            FontWeight.w400,
                            11.5.sp,
                            TextDecoration.underline,
                            R.colors.tealGreen),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonContainer(
      String text, String image, Color textColor, Color containerColor) {
    return Container(
      width: 17.1.h,
      height: 6.8.h,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 5.9.w,
            height: 3.9.h,
          ),
          SizedBox(
            width: 1.h,
          ),
          Text(text,
              style: R.textStyle.bentonSansBold(
                  FontWeight.w400, 12.sp, TextDecoration.none, textColor)),
        ],
      ),
    );
  }
}
