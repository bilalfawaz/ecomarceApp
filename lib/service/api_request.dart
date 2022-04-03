import 'package:dio/dio.dart';
import 'package:ecomarceapp/model/product.dart';
import 'package:retrofit/retrofit.dart';

part 'api_request.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com/")
abstract class ApiRequest {
  factory ApiRequest (Dio dio, { String baseUrl}) = _ApiRequest;


  @GET("/products")
  Future<Product> getAllData();
}