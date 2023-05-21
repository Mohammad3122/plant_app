import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/cart_plant_widget.dart';
import 'package:plant_app/widgets/extensions.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;

  const CartPage({
    super.key,
    required this.addedToCartPlants,
  });

  @override
  State<CartPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<CartPage> {
  int calculateTotalPrice() {
    int total = 0;
    if (widget.addedToCartPlants.isEmpty) {
      total = 0;
    } else {
      for (Plant data in widget.addedToCartPlants) {
        total = total + data.price;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      'assets/images/add-cart.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'سبد خرید تار  عنکبوت بسته است',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                        fontFamily: 'YekanBakh'),
                  )
                ],
              ),
            )
          : Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
              // height: size.height * 0.5,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.addedToCartPlants.length,
                      itemBuilder: (context, index) {
                        return CartPlantWidget(
                          plantList: widget.addedToCartPlants,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20.0,
                                child: Image.asset(
                                    'assets/images/PriceUnit-green.png'),
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                "${calculateTotalPrice()}".fariNumber,
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Constants.primaryColor,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'جمع کل',
                            style: TextStyle(
                              fontFamily: 'LaleZar',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
