import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/utilis/field_validations.dart';
import 'package:masmas/utilis/widget/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';
import 'confirmation_view.dart';

class NewPassword extends StatefulWidget {
  static String route = "/new_password";
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController newPassword = TextEditingController();
  FocusNode newPasswordNode = FocusNode();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode confirmPasswordNode = FocusNode();
  bool _obsecuretext = true;
  bool _obsecure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalWidget(
                  showText: false,
                  image: R.images.patternBack,
                  text: LocalizationMap.getValues('reset_your_password_here'),
                  subtitle: LocalizationMap.getValues(
                      'select_which_contact_details_should_we_use_to_reset_your_password')),
              SizedBox(
                height: 1.h,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                validator: (value) {
                  return FieldValidation.validateConfirmPassword(
                      value, newPassword.text);
                },
                decoration: R.fieldDecoration.decoration(
                  textStyle: R.textStyle.bentonSansRegularRegular(
                      FontWeight.w400,
                      11.sp,
                      TextDecoration.none,
                      Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white.withOpacity(.3)
                          : R.colors.darkGray.withOpacity(.3)),
                  hint: LocalizationMap.getValues('new_password'),
                  radius: 15,
                  fillcolor: Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.white.withOpacity(.1)
                      : R.colors.white,
                  borderColor: Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.black
                      : R.colors.ghostWhite.withOpacity(.9),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecure = !_obsecure;
                        });
                      },
                      child: Icon(_obsecure
                          ? Icons.remove_red_eye
                          : Icons.visibility_off)),
                ),
                focusNode: newPasswordNode,
                keyboardType: TextInputType.visiblePassword,
                controller: newPassword,
                obscureText: _obsecure,
              ),
              SizedBox(
                height: 3.h,
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
                validator: (value) {
                  return FieldValidation.validateConfirmPassword(
                      value, newPassword.text);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: R.fieldDecoration.decoration(
                    hint: LocalizationMap.getValues('confirm_password'),
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
                    radius: 15,
                    fillcolor: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.white.withOpacity(.1)
                        : R.colors.white,
                    borderColor: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.black
                        : R.colors.ghostWhite.withOpacity(.9)),
                focusNode: confirmPasswordNode,
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPassword,
                obscureText: _obsecuretext,
              ),
              SizedBox(
                height: 36.h,
              ),
              Center(
                  child: MyButton(
                      width: 40.w,
                      height: 7.h,
                      title: LocalizationMap.getValues('next'),
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(ConfirmationView.route);
                        } else {
                          log('invalid');
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
