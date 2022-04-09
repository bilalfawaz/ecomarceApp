import 'package:ecomarceapp/logic/binding/auth_controller.dart';
import 'package:ecomarceapp/service/firebase_database.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/firebase_auth.dart';
import '../widget/dark_mode.dart';

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
              const DarkMode(),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Get.isDarkMode ?  Colors.white : Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.defaultDialog(
                      textCancel: "Cancel",
                      textConfirm: "Ok",
                      onConfirm: (){
                        FireAuth.signOutGoogle(context: context);
                      },
                      onCancel: (){
                        Get.back();
                      },
                      middleText: "Are You Sure You Went To Logout?",
                      title: "LogOut",
                    );
                    },
                  child: const Text("logout")),
            ],
          )),
    );
  }
}
