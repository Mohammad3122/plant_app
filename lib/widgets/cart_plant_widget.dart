import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extensions.dart';

class CartPlantWidget extends StatefulWidget {
  final List<Plant> _plantList;
  final int index;

  const CartPlantWidget({
    super.key,
    required List<Plant> plantList,
    required this.index,
  }) : _plantList = plantList;

  @override
  State<CartPlantWidget> createState() => _CartPlantWidgetState();
}

class _CartPlantWidgetState extends State<CartPlantWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailPage(
              plantId: widget._plantList[widget.index].plantId,
            ),
            type: PageTransitionType.fade,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 80.0,
        width: size.width,
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20.0,
                  child: Image.asset('assets/images/PriceUnit-green.png'),
                ),
                const SizedBox(width: 5.0),
                Text(
                  widget._plantList[widget.index].price.toString().fariNumber,
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    color: Constants.primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child:
                        Image.asset(widget._plantList[widget.index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget._plantList[widget.index].category,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'YekanBakh',
                        ),
                      ),
                      Text(
                        widget._plantList[widget.index].plantName,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'YekanBakh',
                            color: Constants.blackColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
