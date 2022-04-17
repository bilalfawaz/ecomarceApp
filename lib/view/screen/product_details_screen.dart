import 'package:ecomarceapp/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/product_details/add_cart.dart';
import '../widget/product_details/close_info.dart';
import '../widget/product_details/image_sliders.dart';
import '../widget/product_details/sized_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);
  ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageNetwork: productModels.image),
              CloseInfo(
                  title: productModels.title,
                  productId: productModels.id,
                  rate: productModels.rating.rate,
                  description: productModels.description),
              const SizedList(),
              AddCart(priceValie: productModels.price,productModels: productModels),
            ],
          ),
        ),
      ),
    );
  }
}
