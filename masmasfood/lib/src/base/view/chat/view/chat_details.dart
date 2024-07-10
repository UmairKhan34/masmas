// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';

import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/model/base_model.dart';
import 'package:masmas/src/base/view/chat/view/widget/common_widget.dart';
import 'package:masmas/src/base/view/chat/view/widget/more_widget.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

class ChatDetails extends StatefulWidget {
  static String route = "/chat_details";
  ChatUserModel? chatModel;
  ChatDetails({super.key, this.chatModel});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  TextEditingController myController = TextEditingController();
  FocusNode node = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVM>(
        builder: (context, baseVm, child) => Scaffold(
              backgroundColor: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.profileScreen
                  : R.colors.ghostWhite,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CommonWidget(
                          onpress: () {
                            Get.back();
                          },
                          image: R.images.patternImage,
                          text: LocalizationMap.getValues('chat'),
                          height: 41.h,
                        ),
                        Positioned(
                          top: 22.h,
                          left: 2.w,
                          child: MoreWidget(
                            onpress: () {},
                            image: widget.chatModel!.image ?? "",
                            title: widget.chatModel!.name ?? "",
                            subtitle: 'Online',
                            trailing: R.images.call,
                            height: 0.h,
                            istext: false,
                            isonline: true,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 48.h, child: messageList(baseVm)),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: TextFormField(
                          autovalidateMode: AutovalidateMode.disabled,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: myController,
                          focusNode: node,
                          keyboardType: TextInputType.text,
                          decoration: R.fieldDecoration.decoration(
                            textStyle: R.textStyle.bentonSansRegularRegular(
                                FontWeight.w400,
                                11.sp,
                                TextDecoration.none,
                                Constant.themeMode == "ThemeMode.dark"
                                    ? R.colors.white.withOpacity(.8)
                                    : R.colors.darkGray.withOpacity(.3)),
                            hint: LocalizationMap.getValues("okay_i_m_waiting"),
                            radius: 15,
                            fillcolor: Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.bottomNavigation
                                : R.colors.ghostWhite,
                            borderColor: Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.bottomNavigation
                                : R.colors.ghostWhite,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: R.colors.pineGreen,
                              ),
                              onPressed: () {
                                if (myController.text.trim().isNotEmpty) {
                                  _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent *
                                        10,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.decelerate,
                                  );
                                  String newMessage = myController.text;
                                  bool isSentByMe = true;
                                  baseVm.addMessage(newMessage, isSentByMe);
                                  log(newMessage);
                                  myController.clear();
                                }
                              },
                            ),
                          ),
                          obscureText: false),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget messageList(BaseVM baseVm) {
    return ListView.builder(
        controller: _scrollController,
        reverse: false,
        itemCount: baseVm.messageList.length,
        itemBuilder: (context, index) {
          return Align(
            alignment: baseVm.messageList[index].isSentByMe == true
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: baseVm.messageList[index].isSentByMe == true
                  ? EdgeInsets.only(
                      left: 2.w, top: 2.h, bottom: 2.h, right: 5.w)
                  : EdgeInsets.only(
                      left: 2.w, top: 2.h, bottom: 2.h, right: 5.w),
              margin: baseVm.messageList[index].isSentByMe == true
                  ? EdgeInsets.only(
                      left: 0.w, top: 2.h, bottom: 2.h, right: 5.w)
                  : EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(13),
                gradient: baseVm.messageList[index].isSentByMe == true
                    ? LinearGradient(
                        colors: [R.colors.tealGreen, R.colors.pineGreen])
                    : LinearGradient(colors: [
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.bottomNavigation.withOpacity(.9)
                            : R.colors.whiteSmoke,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.bottomNavigation.withOpacity(.9)
                            : R.colors.white
                      ]),
              ),
              child: Text(
                baseVm.messageList[index].message ?? "",
                style: baseVm.messageList[index].isSentByMe == true
                    ? R.textStyle.bentonSansBook(FontWeight.w400, 11.sp,
                        TextDecoration.none, R.colors.white)
                    : R.textStyle.bentonSansBook(
                        FontWeight.w400,
                        11.sp,
                        TextDecoration.none,
                        Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.white.withOpacity(.8)
                            : R.colors.thamarBlack),
              ),
            ),
          );
        });
  }
}
