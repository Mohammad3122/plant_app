import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:plant_app/animations/fade_animations.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/widgets/app_methods.dart';
import 'package:plant_app/widgets/extensions.dart';

class DetailPage extends StatefulWidget {
  final int plantId;

  const DetailPage({
    super.key,
    required this.plantId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          // AppBar
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // X Button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                // Like Button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantId].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Stack(
                children: [
                  // Product Image
                  Positioned(
                    top: 10.0,
                    left: 0.0,
                    child: SizedBox(
                      height: 350.0,
                      child: Image.asset(plantList[widget.plantId].imageURL),
                    ),
                  ),
                  // PlantFeature
                  Positioned(
                    top: 10.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            title: 'اندازه‌گیاه',
                            plantFeature: plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'رطوبت‌هوا',
                            plantFeature: plantList[widget.plantId]
                                .humidity
                                .toString()
                                .fariNumber,
                          ),
                          PlantFeature(
                            title: 'دمای‌نگهداری',
                            plantFeature: plantList[widget.plantId]
                                .temperature
                                .fariNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 30.0,
                right: 30.0,
              ),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constants.primaryColor,
                          ),
                          Text(
                            plantList[widget.plantId]
                                .rating
                                .toString()
                                .fariNumber,
                            style: TextStyle(
                              fontFamily: 'LaleZar',
                              color: Constants.primaryColor,
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plantList[widget.plantId].plantName,
                            style: TextStyle(
                              fontFamily: 'LaleZar',
                              color: Constants.primaryColor,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              SizedBox(
                                height: 19.0,
                                child: Image.asset(
                                    'assets/images/PriceUnit-green.png'),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                plantList[widget.plantId]
                                    .price
                                    .toString()
                                    .fariNumber,
                                style: TextStyle(
                                  fontFamily: 'LaleZar',
                                  color: Constants.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  FadeAnimation(
                    delay: 0.5,
                    child: Text(
                      plantList[widget.plantId].decription,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'iranSans',
                        color: Constants.blackColor.withOpacity(0.7),
                        height: 1.6,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: [
            FadeAnimation(
              delay: 1,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0.0, 1.1),
                        blurRadius: 5.0,
                        color: Constants.primaryColor.withOpacity(0.5))
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          child: CartPage(
                              addedToCartPlants: Plant.addedToCartPlants()),
                          type: PageTransitionType.fade,
                        ));
                  },
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 12,
                        left: 13,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 25,
                        child: SizedBox(
                          width: 30,
                          height: 50,
                          // color: Colors.red,
                          child: Text(
                            "${changeCartNumber(
                              CartPage(
                                addedToCartPlants: Plant.addedToCartPlants(),
                              ),
                            )}"
                                .fariNumber,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            FadeAnimation(
              delay: 1,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    bool isSelected =
                        toggleIsSelected(plantList[widget.plantId].isSelected);
                    plantList[widget.plantId].isSelected = isSelected;
                    AddToCart.addToCart(isSelected, context);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                splashColor: const Color.fromARGB(255, 29, 99, 2),
                minWidth: size.width * 0.7,
                height: size.height * 0.9,
                color: Constants.primaryColor,
                child: const Text(
                  'افزودن به سبد خرید',
                  style: TextStyle(
                    fontFamily: 'LaleZar',
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int changeCartNumber(CartPage cartPage) {
    int sabad = 0;
    setState(() {
      if (cartPage.addedToCartPlants.isEmpty) {
        sabad = 0;
      } else {
        sabad = cartPage.addedToCartPlants.length;
      }
    });
    return sabad;
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'LaleZar',
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'LaleZar',
          ),
        ),
      ],
    );
  }
}
