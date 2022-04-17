import 'package:ecomarceapp/logic/controller/product_controller.dart';
import 'package:ecomarceapp/utils/my_string.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CloseInfo extends StatelessWidget {
  CloseInfo({Key? key, required this.title, required this.productId,required this.rate,required this.description})
      : super(key: key);
  String title;
  int productId;
  double rate;
  String description;
  var productController = Get.find<ProductController>();
  Color textColor= Get.isDarkMode ? Colors.white:Colors.black;
  Color showLessText = Get.isDarkMode?pinkClr : mainColor;
  TextStyle showLessTextStyle = TextStyle(color: Get.isDarkMode?pinkClr : mainColor,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {
                      productController.manageFavorite(productId);
                    },
                    child: Icon(
                        productController.addFavoriteProduct(productId)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.red,
                        size: 20),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: "$rate",
                  color: Get.isDarkMode ? Colors.white :Colors.black,
                  underLine: TextDecoration.none),
              const SizedBox(width: 10,),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          ReadMoreText(
            description,
            trimLines: 2,
            lessStyle: showLessTextStyle,
            textAlign: TextAlign.justify,
            colorClickableText:showLessText,
            trimMode: TrimMode.Line,
            trimCollapsedText: showMore.tr,
            trimExpandedText: showLess.tr,
            style: TextStyle(color: textColor),
            moreStyle: showLessTextStyle,
          ),
        ],
      ),
    );
  }
}
