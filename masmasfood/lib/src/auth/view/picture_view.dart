import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/src/auth/view/user_location_view.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/utilis/widget/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Utilis/Button.dart';
import '../../../resources/app_localization.dart';

class UploadPicture extends StatefulWidget {
  static String route = "/upload_picture";
  const UploadPicture({super.key});

  @override
  State<UploadPicture> createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  final ImagePicker picker = ImagePicker();
  XFile? _selectedImageGallery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.profileScreen
          : R.colors.white.withOpacity(1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalWidget(
                showText: false,
                image: R.images.patternBack,
                text: LocalizationMap.getValues('upload_your_photo_profile'),
                subtitle: LocalizationMap.getValues(
                    'this_data_will_be_displayed_in_your_account_profile_for_security')),
            SizedBox(
              height: 3.h,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    child: _selectedImageGallery != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              File(_selectedImageGallery!.path),
                              width: 245,
                              height: 238,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Column(
                            children: [
                              Center(
                                child: Container(
                                  height: 15.h,
                                  width: 85.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color:
                                          Constant.themeMode == "ThemeMode.dark"
                                              ? R.colors.white.withOpacity(.3)
                                              : R.colors.whiteSmoke
                                                  .withOpacity(.9)),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () async {
                                        final XFile? image =
                                            await picker.pickImage(
                                                source: ImageSource.gallery);
                                        if (image != null) {
                                          setState(() {
                                            _selectedImageGallery = image;
                                          });
                                        }
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            R.images.gallery,
                                            width: 20.w,
                                            height: 6.h,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            LocalizationMap.getValues(
                                              'form_gallery',
                                            ),
                                            style: R.textStyle.bentonSansBold(
                                                FontWeight.w400,
                                                11.sp,
                                                TextDecoration.none,
                                                Constant.themeMode ==
                                                        "ThemeMode.dark"
                                                    ? R.colors.white
                                                    : R.colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Center(
                                child: Container(
                                  height: 15.h,
                                  width: 85.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color:
                                          Constant.themeMode == "ThemeMode.dark"
                                              ? R.colors.white.withOpacity(.3)
                                              : R.colors.whiteSmoke
                                                  .withOpacity(.9)),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () async {
                                        final XFile? photo =
                                            await picker.pickImage(
                                                source: ImageSource.camera);
                                        if (photo != null) {
                                          setState(() {
                                            _selectedImageGallery = photo;
                                          });
                                        }
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            R.images.camera,
                                            width: 20.w,
                                            height: 6.h,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            LocalizationMap.getValues(
                                              'from_camera',
                                            ),
                                            style: R.textStyle.bentonSansBold(
                                                FontWeight.w400,
                                                11.sp,
                                                TextDecoration.none,
                                                Constant.themeMode ==
                                                        "ThemeMode.dark"
                                                    ? R.colors.white
                                                    : R.colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Positioned(
                    top: 1.h,
                    left: 70.w,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedImageGallery = null;
                          });
                        },
                        child: Image.asset(
                          R.images.close,
                          width: 3.1.h,
                          height: 12.w,
                        ))),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Center(
                child: MyButton(
                    width: 40.w,
                    height: 7.h,
                    title: LocalizationMap.getValues('next'),
                    onpress: () {
                      Get.toNamed(UserLocationView.route);
                    }))
          ],
        ),
      ),
    );
  }
}
