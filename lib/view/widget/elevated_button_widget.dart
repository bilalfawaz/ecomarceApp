import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({Key? key,required this.buttonText,required this.onPressed}) : super(key: key);

  String buttonText;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:Get.isDarkMode? pinkClr:mainColor,
          minimumSize: const Size(360, 50)
        ),
        onPressed: onPressed,
        child: TextUtils(
          color: Colors.white,
          text: buttonText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          underLine: TextDecoration.none,
        ),
    );
  }
}
