import 'package:ecomarceapp/logic/controller/category_controller.dart';
import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:ecomarceapp/view/widget/catigory/category_cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../utils/themes.dart';
import '../../screen/product_details_screen.dart';
import '../cart_widget/build_cart_items.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key,required this.categoryTitle}) : super(key: key);
  String categoryTitle;

  var categoryController = Get.find<CategoryController>();
  var productController = Get.find<ProductController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx(() {
        if (categoryController.isAllCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(
            itemCount: categoryController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return CategoryCartItems(
                image: categoryController.categoryList[index].image,
                price: categoryController.categoryList[index].price,
                rate: categoryController.categoryList[index].rating.rate,
                productId: categoryController.categoryList[index].id,
                productModels: categoryController.categoryList[index],
                onTap: () {
                  Get.to(() => ProductDetailsScreen(
                        productModels: categoryController.categoryList[index],
                      ));
                },
              );
            },
          );
        }
      }),
    );
  }
}
