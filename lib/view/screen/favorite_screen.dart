import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:ecomarceapp/utils/my_string.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  var controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx((){
        if(controller.favoriteProductList.isEmpty){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/heart.png"),
                ),
                const SizedBox(height: 20,),
                Text(
                  favoriteProduct.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black
                ),),
              ],
            ),
          );
        }else{
        return  ListView.separated(
            itemBuilder: (context, index){
                return buildFavorite(
                    controller.favoriteProductList[index].title,
                    controller.favoriteProductList[index].price,
                    controller.favoriteProductList[index].image,
                    controller.favoriteProductList[index].id
                );
              },
            separatorBuilder: (context,index){
              return const Divider();
            },
            itemCount: controller.favoriteProductList.length);
      }
      }),


    );
  }

  /// List View Design
  Widget buildFavorite(name,price,image,productId){
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,),
                ),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                   name,
                   style: TextStyle(
                     color:Get.isDarkMode?Colors.white: Colors.black,
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                     overflow: TextOverflow.ellipsis
                 ),),
                  SizedBox(height: 5,),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                        color:Get.isDarkMode?Colors.white: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                    ),),
                ],
              ),
            ),
            IconButton(
              onPressed: (){
                controller.manageFavorite(productId);
              },
              icon: const Icon(Icons.favorite,color: Colors.red,size: 30,),

            )

          ],
        ),
      ),
    );
  }
}
