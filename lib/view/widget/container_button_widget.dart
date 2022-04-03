import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/themes.dart';


class ContainerButtonWidget extends StatelessWidget {
   ContainerButtonWidget({Key? key,required this.firstText,required this.secondText,required this.onTap}) : super(key: key);

  String firstText;
  String secondText;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: firstText,
              color: Colors.white,
              underLine: TextDecoration.none),
          InkWell(
            onTap: onTap,
            child: TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: secondText,
                color: Colors.white,
                underLine: TextDecoration.underline),
          ),
        ],
      ),
      decoration:  BoxDecoration(
          color: Get.isDarkMode? mainColor:pinkClr,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.07,
    );
  }
}
