import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/utilis/field_validations.dart';
import 'package:sizer/sizer.dart';
import '../../../Utilis/Button.dart';
import '../../../resources/app_localization.dart';
import 'bio_data_view.dart';
import 'package:masmas/resources/resources.dart';

class SignUpView extends StatefulWidget {
  static String route = "/signup";
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController namecontroller = TextEditingController();
  FocusNode namenode = FocusNode();
  bool isChecked = false;
  bool isAnotherChecked = false;
  bool _obsecuretext = true;

  TextEditingController emailcontroller = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(child: Image.asset(R.images.patternImage)),
              Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Image.asset(
                      R.images.logoimage,
                      height: 20.h,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      R.images.appNameImage,
                      width: 80.w,
                      height: 64,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    LocalizationMap.getValues('sign_up_for_free'),
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
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: Column(
                      children: [
                        TextFormField(
                            style: R.textStyle.bentonSansRegularRegular(
                                FontWeight.w400,
                                12.sp,
                                TextDecoration.none,
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white
                                    : R.colors.black),
                            textInputAction: TextInputAction.next,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            validator: (value) {
                              return FieldValidation.validateUserName(value);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: namecontroller,
                            focusNode: namenode,
                            decoration: R.fieldDecoration.decoration(
                              hint: LocalizationMap.getValues('anamwp'),
                              textStyle: R.textStyle.bentonSansRegularRegular(
                                  FontWeight.w400,
                                  11.sp,
                                  TextDecoration.none,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white.withOpacity(.3)
                                      : R.colors.darkGray.withOpacity(.3)),
                              radius: 15,
                              fillcolor: Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.1)
                                  : R.colors.white,
                              borderColor:
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.black
                                      : R.colors.ghostWhite.withOpacity(.9),
                              prefixIcon: const Icon(Icons.person),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false),
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
                            textInputAction: TextInputAction.next,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: emailcontroller,
                            focusNode: emailNode,
                            validator: (value) {
                              return FieldValidation.validateEmail(value);
                            },
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
                              borderColor:
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.black
                                      : R.colors.ghostWhite.withOpacity(.9),
                              prefixIcon: const Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return FieldValidation.validatePassword(value);
                            },
                            decoration: R.fieldDecoration.decoration(
                              hint: LocalizationMap.getValues('password'),
                              textStyle: R.textStyle.bentonSansRegularRegular(
                                  FontWeight.w400,
                                  11.sp,
                                  TextDecoration.none,
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.white.withOpacity(.3)
                                      : R.colors.darkGray.withOpacity(.3)),
                              radius: 15,
                              fillcolor: Constant.themeMode == "ThemeMode.dark"
                                  ? R.colors.white.withOpacity(.1)
                                  : R.colors.white,
                              borderColor:
                                  Constant.themeMode == "ThemeMode.dark"
                                      ? R.colors.black
                                      : R.colors.ghostWhite.withOpacity(.9),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obsecuretext = !_obsecuretext;
                                    });
                                  },
                                  child: Icon(_obsecuretext
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off)),
                            ),
                            controller: passwordcontroller,
                            focusNode: passwordNode,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obsecuretext),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.5.w,
                      ),
                      Checkbox(
                        activeColor: const Color(0xff53E88B),
                        side: const BorderSide(color: Colors.green),
                        shape: const CircleBorder(),
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue ?? false;
                          });
                        },
                      ),
                      Text(
                        LocalizationMap.getValues('keep_me_signed_in'),
                        textAlign: TextAlign.center,
                        style: R.textStyle.bentonSansBook(
                            FontWeight.w400,
                            9.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.5.w,
                      ),
                      Checkbox(
                        activeColor: const Color(0xff53E88B),
                        side: const BorderSide(color: Colors.green),
                        shape: const CircleBorder(),
                        value: isAnotherChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isAnotherChecked = newValue ?? false;
                          });
                        },
                      ),
                      Text(
                        LocalizationMap.getValues(
                            'email_me_about_special_pricing'),
                        textAlign: TextAlign.center,
                        style: R.textStyle.bentonSansBook(
                            FontWeight.w400,
                            9.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  MyButton(
                    width: 50.w,
                    height: 8.h,
                    onpress: () {
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed(BioDataView.route);
                      } else {
                        log('invalid');
                      }
                    },
                    title: LocalizationMap.getValues('create_account'),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      LocalizationMap.getValues('already_have_an_account'),
                      style: R.textStyle.bentonSansMedium(
                          FontWeight.w400,
                          11.5.sp,
                          TextDecoration.underline,
                          R.colors.tealGreen),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget myRow(String text,bool val) {
  //   return Row(
  //     children: [
  //       SizedBox(
  //         width: 2.5.h,
  //       ),
  //       Checkbox(
  //         activeColor: const Color(0xff53E88B),
  //         side: const BorderSide(color: Colors.green),
  //         shape: const CircleBorder(),
  //         value: isAnotherChecked,
  //         onChanged: (bool? newValue) {
  //           setState(() {
  //             val = newValue ?? false;
  //           });
  //         },
  //       ),
  //       Text(
  //         text,
  //         textAlign: TextAlign.center,
  //         style: R.textStyle.bentonSansBook(
  //             FontWeight.w400, 9.sp, TextDecoration.none, R.colors.dark),
  //       ),
  //     ],
  //   );
  // }
}
