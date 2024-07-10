// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/app_localization.dart';

import 'package:masmas/resources/resources.dart';
// import 'package:masmas/src/base/model/base_model.dart';
import 'package:masmas/src/base/view/chat/view/chat_details.dart';
import 'package:masmas/src/base/view/chat/view/widget/common_widget.dart';
import 'package:masmas/src/base/view/chat/view/widget/more_widget.dart';
import 'package:masmas/src/base/view_model/base_vm.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVM>(
        builder: (context, baseVm, child) => Scaffold(
            backgroundColor: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.profileScreen
                : R.colors.white.withOpacity(.5),
            body: Column(
              children: [
                CommonWidget(
                  onpress: () {},
                  image: R.images.patternBack,
                  text: LocalizationMap.getValues('chat'),
                  height: 21.h,
                ),
                SizedBox(height: 64.h, child: userList(baseVm)),
              ],
            )));
  }

  Widget userList(BaseVM baseVm) {
    return ListView.builder(
        itemCount: baseVm.userModelList.length,
        itemBuilder: (context, index) {
          return MoreWidget(
            onpress: () {
              Get.to(ChatDetails(
                chatModel: baseVm.userModelList[index],
              ));
            },
            image: baseVm.userModelList[index].image ?? "",
            title: baseVm.userModelList[index].name ?? "",
            subtitle: baseVm.userModelList[index].lastMessage ?? "",
            trailing: baseVm.userModelList[index].time ?? "",
            height: 0.h,
            istext: true,
            isonline: false,
          );
        });
  }
}
