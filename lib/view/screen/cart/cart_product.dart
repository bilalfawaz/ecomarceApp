import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/themes.dart';


class CartProduct extends StatelessWidget {
  CartProduct({Key? key,required this.productModels,required this.index,required this.quantity}) : super(key: key);
  ProductModels? productModels;
  int quantity;
  int index;
  var controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.only(left: 20,right: 20,top: 5),
      decoration: BoxDecoration(
        color:Get.isDarkMode? pinkClr.withOpacity(0.6): mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15,),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                        productModels!.image),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(productModels!.title,style: TextStyle(
                  color:Get.isDarkMode?Colors.white: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
                ),),
                const SizedBox(height: 20,),
                Text("\$ ${controller.productSubTotal[index].toStringAsFixed(2)}",style: TextStyle(
                    color:Get.isDarkMode?Colors.white: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis
                ),),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeProduct(productModels!);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )),
                  Text(
                    "${quantity}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.addProduct(productModels!);
                      },
                      icon: Icon(
                        Icons.add_circle_rounded,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ))
                ],
              ),
              IconButton(
                  onPressed: () {
                    controller.removeOneProduct(productModels!);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Get.isDarkMode ? Colors.black : Colors.red,
                  ))
            ],
          ),
          
        ],
      ),
    );
  }
}
