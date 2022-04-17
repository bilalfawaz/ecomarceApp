import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/utils/my_string.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);

  var controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    text: total.tr,
                    color: Colors.grey,
                    underLine: TextDecoration.none),
                Text(
                  "${controller.total}",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Get.isDarkMode ? pinkClr : mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             checkout.tr,
                              style: TextStyle(fontSize: 20),
                            ),
                            const Icon(Icons.shopping_cart)
                          ],
                        ))))
          ],
        ),
      ),
    );
  }
}
