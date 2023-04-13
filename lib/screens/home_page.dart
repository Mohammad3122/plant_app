import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ScanPageState();
}

class _ScanPageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Plant> _plantList = Plant.plantList;

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  final List<String> _plantTypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل‌کار |',
    '| گل‌ باقچه‌ای |',
    '| گل‌ سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Box
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mic,
                        color: Constants.blackColor.withOpacity(0.6),
                      ),
                      const Expanded(
                          child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          textAlign: TextAlign.start,
                          showCursor: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 5.0),
                            hintText: 'جستجو...',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'iranSans',
                            fontSize: 14.0,
                          ),
                        ),
                      )),
                      Icon(
                        Icons.search,
                        color: Constants.blackColor.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Categories
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              height: 70.0,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontFamily: 'iranSAns',
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Product One
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(plantId: _plantList[index].plantId),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: Container(
                      width: 200.0,
                      margin: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.0,
                            right: 20.0,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorite(
                                        _plantList[index].isFavorated);
                                    _plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: Icon(
                                  _plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_outline_outlined,
                                  color: Constants.primaryColor,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50.0,
                            right: 50.0,
                            top: 50.0,
                            bottom: 50.0,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 20.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                r'$' +
                                    _plantList[index]
                                        .price
                                        .toString()
                                        .fariNumber,
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16.0,
                                    fontFamily: 'LaleZar'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    fontFamily: 'YekanBakh',
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                    fontFamily: 'YekanBakh',
                                    color: Colors.white70,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // New Plants - Text
            Container(
              alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.only(right: 18.0, top: 20.0, bottom: 15.0),
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontFamily: 'LaleZar',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // New Plants - Text
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(plantId: _plantList[index].plantId),
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
                                child: Image.asset(
                                    'assets/images/PriceUnit-green.png'),
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                _plantList[index].price.toString().fariNumber,
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
                                  color:
                                      Constants.primaryColor.withOpacity(0.8),
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
                                      Image.asset(_plantList[index].imageURL),
                                ),
                              ),
                              Positioned(
                                bottom: 5.0,
                                right: 80.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      _plantList[index].category,
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        fontFamily: 'YekanBakh',
                                      ),
                                    ),
                                    Text(
                                      _plantList[index].plantName,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
