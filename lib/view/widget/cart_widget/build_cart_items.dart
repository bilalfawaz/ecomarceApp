import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:ecomarceapp/model/product_models.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCartItems extends StatelessWidget {
  BuildCartItems({Key? key,this.textColor,this.image,this.price,this.rate,required this.id,required this.productModels}) : super(key: key);
  Color? textColor;
  String? image;
  double? price,rate;
  int id;
  ProductModels? productModels;
  var controller = Get.find<ProductController>();
  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        child: Column(
          children: [
          Obx((){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      controller.manageFavorite(id);
                    },
                    icon: controller.addFavoriteProduct(id) ?
                    const Icon(
                        Icons.favorite,
                        color: Colors.red
                    ) : Icon(
                    Icons.favorite_outline,
                    color: textColor
                )),
                IconButton(
                    onPressed: () {
                      cartController.addProduct(productModels!);
                    },
                    icon: Icon(
                      Icons.add,
                      color: textColor,
                    ))
              ],
            );
          }),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.17,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                image!,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      text: "\$ $price",
                      color: textColor!,
                      underLine: TextDecoration.none),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3,right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "${rate!}",
                              color: Colors.white,
                              underLine: TextDecoration.none),
                          const Icon(Icons.star,size: 13,color: Colors.white,)
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration:
            BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ]),
      ),
    );
  }
}
