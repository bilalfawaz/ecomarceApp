import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'build_cart_items.dart';


class CardItemsHome extends StatelessWidget {
  CardItemsHome({Key? key,this.textColor}) : super(key: key);
  var controller = Get.find<ProductController>();
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value == true){
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode?pinkClr :mainColor,
          ),
        );
      }else{
        return Expanded(
          child: GridView.builder(
            itemCount: controller.productList.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6,
                maxCrossAxisExtent: 200
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  print(controller.productList[index].title);
                },
                child: BuildCartItems(
                  rate: controller.productList[index].rating.rate,
                  price: controller.productList[index].price,
                  image: controller.productList[index].image,
                  textColor: textColor,
                ),
              );
            },
          ),
        );
      }
    });
  }
}
