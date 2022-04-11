
import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
  }

}