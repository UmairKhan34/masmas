import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/utilis/field_validations.dart';
import 'package:masmas/utilis/widget/global_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';
import '../../../resources/app_localization.dart';
import 'forgot_options_view.dart';

class ForgotView extends StatefulWidget {
  static String route = "/forget_view";
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalWidget(
                  showText: true,
                  timeText: ' 01:30',
                  image: R.images.patternBack,
                  numberText: ' +6282045****.',
                  anotherText:
                      LocalizationMap.getValues('this_code_will_expired_in'),
                  text: LocalizationMap.getValues(
                      'enter_4_digit_verification_code'),
                  subtitle: LocalizationMap.getValues('code_send_to')),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: 90.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white.withOpacity(.1)
                            : R.colors.darkGray.withOpacity(.05),
                        borderRadius: BorderRadius.circular(22)),
                    child: Center(
                      child: PinCodeTextField(
                        validator: (value) {
                          return FieldValidation.validatePinCode(value);
                        },
                        textStyle: R.textStyle.bentonSansMedium(
                            FontWeight.w400,
                            28.sp,
                            TextDecoration.none,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.white
                                : R.colors.obsidianShard),
                        appContext: context,
                        length: 4,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        pinTheme: PinTheme(
                            activeColor: R.colors.darkGray.withOpacity(.05),
                            activeFillColor: R.colors.darkGray.withOpacity(.05),
                            inactiveColor: R.colors.darkGray.withOpacity(.05),
                            selectedColor: R.colors.darkGray.withOpacity(.05),
                            selectedFillColor:
                                R.colors.darkGray.withOpacity(.05),
                            disabledColor: R.colors.darkGray.withOpacity(.05),
                            errorBorderColor:
                                R.colors.darkGray.withOpacity(.05),
                            inactiveFillColor:
                                R.colors.darkGray.withOpacity(.05),
                            borderRadius: BorderRadius.circular(22)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 38.h,
              ),
              Center(
                  child: MyButton(
                      width: 40.w,
                      height: 7.h,
                      title: LocalizationMap.getValues('next'),
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(ForgotOptionsViews.route);
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
