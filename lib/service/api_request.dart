import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/product_models.dart';

part 'api_request.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com/")
abstract class ApiRequest {
  factory ApiRequest (Dio dio, { String baseUrl}) = _ApiRequest;


  @GET("/products")
  Future<ProductModels> getAllData();
}