import 'package:ecomarceapp/model/product_models.dart';
import 'package:ecomarceapp/service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  @override
  void onInit(){
    super.onInit();
    getProducts();
  }
  getProducts()async{
    var product =
    await ProductService().getProduct();
    try{
      isLoading(true);
      if(product.isNotEmpty){
        productList.addAll(product);
      }
    }finally{
      isLoading(false);
    }
  }


}