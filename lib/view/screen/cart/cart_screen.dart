import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/screen/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_product.dart';
import 'cart_total.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  var controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(onPressed: () {
              controller.clearAllProducts();
            }, icon: const Icon(Icons.backspace))
          ],
        ),
        body: Obx(() {
          if(controller.productMap.isEmpty){
            return const EmptyCart();
          }else{
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                          return CartProduct(
                            productModels:
                            controller.productMap.keys.toList()[index],
                            index: index,
                            quantity:
                            controller.productMap.values.toList()[index],
                          );
                        },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: controller.productMap.length),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: CartTotal(),
                )
              ],
            ),
          );}}
        ),
      ),
    );
  }
}
