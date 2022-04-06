import 'package:ecomarceapp/logic/controller/theme_controller.dart';
import 'package:ecomarceapp/service/firebase_auth.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    ThemeController().changesTheme();
                    },
                  child: const Text("Change Mode Colors")),
              const SizedBox(height: 20),
              TextButton(
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
