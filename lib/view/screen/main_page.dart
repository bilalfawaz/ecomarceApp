import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecomarceapp/model/product.dart';
import 'package:ecomarceapp/service/api_request.dart';
import 'package:ecomarceapp/service/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// to get a data from previous page
  var arg = Get.arguments;
  List<Product>? allProduct;
  Map? values;
  String? username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserName();
  }

  /// load user name for current user
  loadUserName()async{
    await FireDatabase.getData(arg[0]).once().then((value) {
      var contact = value.snapshot.value as Map;
      setState(() {
        username = contact['Username'];
      });
    });
  }
   Future<List<Product>> getProduct() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
          future: getProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
                return  Text(snapshot.data![0].title!);

            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
