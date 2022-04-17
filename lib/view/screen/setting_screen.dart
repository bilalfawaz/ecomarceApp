import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/setting_widget/language_widget.dart';
import 'package:ecomarceapp/view/widget/setting_widget/logout_widget.dart';
import 'package:ecomarceapp/view/widget/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDetails(darkMode: Get.isDarkMode ? darkGreyClr : mainColor),
              //const DarkMode(),
              LanguageWidget(),
              const LogoutWidget(),
            ],
          )),
    );
  }
}
