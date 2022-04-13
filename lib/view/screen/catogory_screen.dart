import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/catigory/category_widget.dart';


class CatogoryScreen extends StatelessWidget {
  const CatogoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: TextUtils(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  text: 'Category',
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
