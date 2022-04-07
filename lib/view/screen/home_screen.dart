import 'package:ecomarceapp/view/widget/card_items_home.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/themes.dart';
import '../widget/auth_text_from_field.dart';
import '../widget/searhc_text_home.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  Color textColor = Get.isDarkMode? Colors.white : Colors.black;
  TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration:  BoxDecoration(
                  color: Get.isDarkMode?darkGreyClr:mainColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,top: 8,right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: "Find Your",
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none),
                    TextUtils(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        text: "INSPIRATION",
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    const SearchTextHome(),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: TextUtils(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      text: "Categories",
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            CardItemsHome(textColor:  Colors.black,),
          ],
        ),
      ),
    );
  }
}
