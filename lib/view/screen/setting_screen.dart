import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.isDarkMode ?
              Get.changeThemeMode(ThemeMode.light):
              Get.changeThemeMode(ThemeMode.dark);
            },
            child: const Text("Change Mode Colors"))
      ),
    );
  }
}
