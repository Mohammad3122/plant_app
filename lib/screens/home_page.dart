import 'package:flutter/material.dart';

import 'package:plant_app/const/constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: InkWell(
              onTap: () {},
              child: const Text(
                'رد کردن',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Lalezar',
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        PageView(
          onPageChanged: (int page) {
            setState(() {
              currentIndex = page;
            });
          },
          controller: _pageController,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350.0,
                    child: Image.asset('assets/images/plant-one.png'),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    Constants.titleOne,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'YekanBakh',
                      fontSize: 25.0,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    Constants.descriptionOne,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'iranSans',
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
