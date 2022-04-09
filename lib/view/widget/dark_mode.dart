import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/theme_controller.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  bool isDark = false;
  String status =
      ThemeController().getThemeDataFromBox() ? "Dark Mode" : "Light Mode";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CupertinoSwitch(
              activeColor: pinkClr,
              value: ThemeController().getThemeDataFromBox(),
              onChanged: (value) {
                setState(() {
                  //ThemeController().getThemeDataFromBox() = value;
                  ThemeController().changesTheme();
                  status = ThemeController().getThemeDataFromBox()
                      ? "Dark Mode"
                      : "Light Mode";
                });
              }),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            fontWeight: FontWeight.normal,
            color: ThemeController().getThemeDataFromBox()
                ? Colors.white
                : Colors.blue,
            underLine: TextDecoration.none,
            fontSize: 18,
            text: status,
          ),
        ],
      ),
    );
  }
}
