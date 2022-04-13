import 'package:ecomarceapp/model/product_models.dart';
import 'package:http/http.dart' as http;

import '../../utils/my_string.dart';


class ProductService{
  
  Future <List<ProductModels>> getProduct() async {
    var response =
    await http.get(Uri.parse("$baseUrl/products"));

    if(response.statusCode == 200){
      var jsonbody = response.body;
      return productModelsFromJson(jsonbody);
    }else{
      return throw Exception("Field to Load Product");
    }
  }
}