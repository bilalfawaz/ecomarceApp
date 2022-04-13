import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomarceapp/logic/controller/cart_controller.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/route/route.dart';
import 'color_piker.dart';

class ImageSliders extends StatefulWidget {
  ImageSliders({Key? key, required this.imageNetwork}) : super(key: key);
  String imageNetwork;

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  var cartController = Get.find<CartController>();

  ///if Api Contains Color for Each Product Retrieve from API and remove a list
  List<Color> colorList = [kCOlor1, kCOlor2, kCOlor3, kCOlor4, kCOlor5];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
              autoPlay: true,
              height: 500,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2)),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageNetwork),
                    fit: BoxFit.fill,
                  )),
            );
          },
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotColor: Colors.black),
            )),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30)),
                height: 210,
                width: 50,
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: ColorPiker(
                              color: colorList[index],
                              outerBorder: currentColor == index));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 3,
                      );
                    },
                    itemCount: colorList.length))),
        Container(
          padding: const EdgeInsets.only(top: 20, right: 25, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: -10, end: -3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    "${cartController.countProduct()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? pinkClr.withOpacity(0.8)
                              : mainColor.withOpacity(0.8),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.shopping_cart),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
