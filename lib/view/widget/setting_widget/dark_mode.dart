import 'package:ecomarceapp/utils/my_string.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/theme_controller.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  bool isDark = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.dark_mode,color: Colors.white,),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: TextUtils(
              fontWeight: FontWeight.normal,
              color: ThemeController().getThemeDataFromBox()
                  ? Colors.white
                  : Colors.black,
              underLine: TextDecoration.none,
              fontSize: 18,
              text: ThemeController().getThemeDataFromBox() ? darkMode.tr : lightMode.tr,
            ),
          ),
          CupertinoSwitch(
              activeColor: pinkClr,
              value: ThemeController().getThemeDataFromBox(),
              onChanged: (value) {
                setState(() {
                  //ThemeController().getThemeDataFromBox() = value;
                  ThemeController().changesTheme();
                  // ThemeController().getThemeDataFromBox()
                  //     ? darkMode.tr
                  //     : lightMode.tr;
                });
              }),

        ],
      ),
    );
  }
}
