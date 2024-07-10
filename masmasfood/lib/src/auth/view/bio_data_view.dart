import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';

import 'package:masmas/src/auth/view/payment_method_view.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/utilis/field_validations.dart';
import 'package:masmas/utilis/widget/global_widget.dart';

import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';
import '../../../resources/app_localization.dart';

class BioDataView extends StatefulWidget {
  static String route = "/biodata";
  const BioDataView({super.key});

  @override
  State<BioDataView> createState() => _BioDataViewState();
}

class _BioDataViewState extends State<BioDataView> {
  TextEditingController firstname = TextEditingController();
  FocusNode firstnode = FocusNode();
  TextEditingController lastname = TextEditingController();
  FocusNode lastnode = FocusNode();
  TextEditingController mobileController = TextEditingController();
  FocusNode mobilenode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalWidget(
                  showText: false,
                  image: R.images.patternBack,
                  text: LocalizationMap.getValues(
                      'fill_in_your_bio_to_get_started'),
                  subtitle: LocalizationMap.getValues(
                      'this_data_will_be_displayed_in_your_account_profile_for_security')),
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
                  validator: (value) {
                    return FieldValidation.validateUserName(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstname,
                  keyboardType: TextInputType.name,
                  focusNode: firstnode,
                  decoration: R.fieldDecoration.decoration(
                      hint: LocalizationMap.getValues('first_name'),
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
                      borderColor: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.black
                          : R.colors.ghostWhite.withOpacity(.9)),
                  obscureText: false),
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
                  textInputAction: TextInputAction.next,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return FieldValidation.validateUserName(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: lastname,
                  focusNode: lastnode,
                  decoration: R.fieldDecoration.decoration(
                      hint: LocalizationMap.getValues('last_name'),
                      radius: 15,
                      fillcolor: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.white.withOpacity(.1)
                          : R.colors.white,
                      borderColor: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.black
                          : R.colors.ghostWhite.withOpacity(.9),
                      textStyle: R.textStyle.bentonSansRegularRegular(
                          FontWeight.w400,
                          11.sp,
                          TextDecoration.none,
                          Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.white.withOpacity(.3)
                              : R.colors.darkGray.withOpacity(.3))),
                  obscureText: false),
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
                  controller: mobileController,
                  validator: (value) {
                    return FieldValidation.validateMobileNumber(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  focusNode: mobilenode,
                  decoration: R.fieldDecoration.decoration(
                    hint: LocalizationMap.getValues('mobile_number'),
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
                    borderColor: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.black
                        : R.colors.ghostWhite.withOpacity(.9),
                  ),
                  keyboardType: TextInputType.phone,
                  obscureText: false),
              SizedBox(
                height: 28.h,
              ),
              Center(
                  child: MyButton(
                      width: 40.w,
                      height: 7.h,
                      title: LocalizationMap.getValues('next'),
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(PaymentMethodView.route);
                        }
                      })),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
