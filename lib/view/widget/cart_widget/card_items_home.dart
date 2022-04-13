import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/route/route.dart';
import 'build_cart_items.dart';

class CardItemsHome extends StatelessWidget {
  CardItemsHome({Key? key, this.textColor}) : super(key: key);
  var controller = Get.find<ProductController>();
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value == true) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset("assets/images/search_empty_dark.png")
                  : Image.asset("assets/images/search_empry_light.png")
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 9.0,
                      crossAxisSpacing: 6,
                      maxCrossAxisExtent: 200),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                              productModels: controller.searchList.isEmpty
                                  ? controller.productList[index]
                                  : controller.searchList[index],
                            ));
                      },
                      child: BuildCartItems(
                        rate: controller.searchList.isEmpty
                            ? controller.productList[index].rating.rate
                            : controller.searchList[index].rating.rate,
                        price: controller.searchList.isEmpty
                            ? controller.productList[index].price
                            : controller.searchList[index].price,
                        image: controller.searchList.isEmpty
                            ? controller.productList[index].image
                            : controller.searchList[index].image,
                        textColor: textColor,
                        id: controller.searchList.isEmpty
                            ? controller.productList[index].id
                            : controller.searchList[index].id,
                        productModels: controller.searchList.isEmpty
                            ? controller.productList[index]
                            : controller.searchList[index],
                      ),
                    );
                  },
                ),
        );
      }
    });
  }
}
