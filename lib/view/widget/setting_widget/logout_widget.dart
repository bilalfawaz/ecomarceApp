import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/firebase_auth.dart';
import '../../../utils/my_string.dart';



class LogoutWidget extends StatelessWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              )),
          TextButton(
              style: TextButton.styleFrom(
                primary: Get.isDarkMode ? Colors.white : Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Get.defaultDialog(
                  textCancel: "Cancel",
                  textConfirm: ok.tr,
                  onConfirm: () {
                    FireAuth.signOutGoogle(context: context);
                  },
                  onCancel: () {
                    Get.back();
                  },
                  middleText: "Are You Sure You Went To Logout?",
                  title: logout.tr,
                );
              },
              child: Text(logout.tr)),
        ],
      ),
    );
  }
}
