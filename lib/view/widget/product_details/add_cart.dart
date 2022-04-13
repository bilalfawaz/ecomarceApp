import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/product_models.dart';
import '../../../utils/themes.dart';
import '../text_utils.dart';

class AddCart extends StatelessWidget {
  AddCart({Key? key, required this.price, required this.productModels})
      : super(key: key);

  double price;
  var cartController = Get.find<CartController>();
  ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: "Price",
                  color: Colors.grey,
                  underLine: TextDecoration.none),
              Text(
                "$price",
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
                      onPressed: () {
                        cartController.addProduct(productModels);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Add To Cart",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.shopping_cart)
                        ],
                      ))))
        ],
      ),
    );
  }
}
