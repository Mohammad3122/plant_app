import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:plant_app/animations/fade_animations.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extensions.dart';
import 'package:plant_app/widgets/plant_widget.dart';

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
    ' پیشنهادی ',
    ' آپارتمانی ',
    ' محل‌کار ',
    ' گل‌ باقچه‌ای ',
    ' گل‌ سمی ',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Box
            FadeAnimation(
              delay: 1,
              child: Padding(
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
            ),
            // Categories
            FadeAnimation(
              delay: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
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
                            fontSize: selectedIndex == index ? 18 : 14,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
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
            ),
            // Product One
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(
                            plantId: _plantList[index].plantId,
                          ),
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
                            child: FadeAnimation(
                              delay: 1.5,
                              child: Image.asset(
                                _plantList[index].imageURL,
                              ),
                            ),
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
                              child: FadeAnimation(
                                delay: 1.5,
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
                          ),
                          Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FadeAnimation(
                                  delay: 1.5,
                                  child: Text(
                                    _plantList[index].category,
                                    style: const TextStyle(
                                      fontFamily: 'YekanBakh',
                                      color: Colors.white70,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                FadeAnimation(
                                  delay: 2,
                                  child: Text(
                                    _plantList[index].plantName,
                                    style: const TextStyle(
                                      fontFamily: 'YekanBakh',
                                      color: Colors.white70,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
            FadeAnimation(
              delay: 2,
              child: Container(
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
            ),
            // New Plants - Product 2
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    delay: 0.7,
                    child: NewPlantWidget(
                      plantList: _plantList,
                      index: index,
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
