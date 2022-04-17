import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/my_string.dart';

class SearchTextHome extends StatelessWidget {
  SearchTextHome({Key? key}) : super(key: key);
  var productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (context) {
        return TextField(
          controller: productController.searchController,
          onChanged: (name){
            productController.searchToList(name);
          },
          style: const TextStyle(
            color: Colors.black
          ),
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: searchTextForm.tr,
            hintStyle: const TextStyle(
                color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.red,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.green,
            ),
            suffixIcon:productController.searchController.text.isNotEmpty? IconButton(
              onPressed: (){
                productController.clearSearch();
              },
              icon: const Icon(Icons.close,color: Colors.black,),
            ):null,
          ),
        );
      }
    );
  }
}
