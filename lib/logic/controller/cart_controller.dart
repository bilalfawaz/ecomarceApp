import 'package:ecomarceapp/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productMap = {}.obs;
  get productSubTotal => productMap.entries.map((e) => e.key.priceValie * e.value).toList();
  get total =>productMap.entries
      .map((e) => e.key.priceValie * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  void addProduct(ProductModels productKey) {
    if (productMap.containsKey(productKey)) {
      productMap[productKey] += 1;
      Get.snackbar("Add", "Product Added",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green,colorText: Colors.white);
    } else {
      productMap[productKey] = 1;
      Get.snackbar("Add", "Product Added",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green,colorText: Colors.white);
    }
  }

  void removeProduct(ProductModels productKey) {
    if(productMap.containsKey(productKey) && productMap[productKey] == 1){
      productMap.removeWhere((key, value) => key == productKey);
    }else{
      productMap[productKey] -=1;
    }
  }

  void removeOneProduct(ProductModels productKey) {
    productMap.removeWhere((key, value) => key == productKey);
  }

  int countProduct() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries.map((e) => e.value).toList().reduce((value,
          element) => value + element);
    }
  }

  void clearAllProducts() {
    Get.defaultDialog(
      textCancel: "Cancel",
      textConfirm: "Clear",
      onConfirm: (){
        productMap.clear();
        Get.back();
      },
      onCancel: (){
      },
      middleText: "Are You Sure You Went To Clear All Cart ?",
      title: "LogOut",
    );

  }
}
