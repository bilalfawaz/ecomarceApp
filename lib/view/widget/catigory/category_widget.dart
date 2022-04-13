import 'package:ecomarceapp/logic/controller/category_controller.dart';
import 'package:ecomarceapp/view/widget/catigory/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  var categoryContainer = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(categoryContainer.isCatgeoryLoading.value){
        return Center(child: CircularProgressIndicator());
      }else {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      /// to get all product in category depend of index (name of category)
                      categoryContainer.getCategoryIndex(index);
                      Get.to(CategoryItems(categoryTitle: categoryContainer.categoryNameList[index],));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                categoryContainer.imageCategory[index],
                              ),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            categoryContainer.categoryNameList[index],
                            style: const TextStyle(
                              backgroundColor: Colors.black38,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ));
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: categoryContainer.categoryNameList.length),
        );
      }
    });
  }
}
