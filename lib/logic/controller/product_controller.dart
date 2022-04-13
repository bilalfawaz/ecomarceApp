import 'package:ecomarceapp/model/product_models.dart';
import 'package:ecomarceapp/service/product_service_api/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoriteProductList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var isFavorites = false.obs;
  var storage = GetStorage();
  var searchList = <ProductModels>[].obs;
  var searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storageList = storage.read<List>(productFavoriteValue);
    if (storageList != null) {
      favoriteProductList =
          storageList.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  getProducts() async {
    var product = await ProductService().getProduct();
    try {
      isLoading(true);
      if (product.isNotEmpty) {
        productList.addAll(product);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorite(int productId) async {
    // favoriteProductList.indexWhere((element) => element.id==productId);
    var indexFavorite =
        favoriteProductList.indexWhere((element) => element.id == productId);
    if (indexFavorite >= 0) {
      favoriteProductList.removeAt(indexFavorite);
      await storage.remove(productFavoriteValue);
    } else {
      favoriteProductList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write(productFavoriteValue, favoriteProductList);
    }
    // favoriteProductList.firstWhere((element) => element.id == productId);
  }

  ///Logic For Favorite Screen
  bool addFavoriteProduct(int productId) {
    return favoriteProductList.any((element) => element.id == productId);
  }

  /// Search Bar Logic
  void searchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchController.clear();
    searchToList("");
  }
}
