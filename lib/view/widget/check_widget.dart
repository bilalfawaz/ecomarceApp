import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({Key? key, required this.value, required this.onChange,required this.secondText,required this.firstText,required this.secondTextDecoration})
      : super(key: key);

  bool value = false;
  Function onChange;
  String firstText,secondText;
  TextDecoration secondTextDecoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: Get.isDarkMode ? Colors.black : Colors.white,),
          child: Checkbox(
            value: value,
            onChanged: (value) => onChange(value),
            checkColor: Get.isDarkMode ? Colors.green : Colors.white,
            activeColor:Get.isDarkMode ? Colors.grey.shade200 : pinkClr,
          ),
        ),
        TextUtils(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            text: firstText,
            color: Get.isDarkMode ? Colors.black :Colors.white,
            underLine: TextDecoration.none),
         TextUtils(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            text: secondText,
            color: Get.isDarkMode ? Colors.black :Colors.white,
            underLine: secondTextDecoration)
      ],
    );
  }
}
