import 'dart:async';

import 'package:flutter/material.dart';
import 'package:readerabooks/HomeScreen/Home.dart';
import 'package:readerabooks/Definingpage/DefiningPage.dart';
import 'package:readerabooks/StartScreens/AdditionScreens/Indicator.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
    final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 6), (timer) {
      if (_currentPage < 2) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0); // Переключаемся на первую страницу
      }
    });

  }

  @override
  void dispose() {
    _timer?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              Container(
                color: Colors.red,
                child: Center(
                  child: Text("Страница 1"),
                ),
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: Text("Страница 2"),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text("Страница 3"),
                ),
              ),
            ],
          ),
          Positioned(
  left: 20.0,
  bottom: 20.0,
  right: 20.0,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Добавьте это
    children: [
      Row(
        children: [
          for (int i = 0; i < 3; i++)
        Indicator(
          isCurrentPage: i == _currentPage,
        ),
        ],
      ),
      
      
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (_currentPage > 0) {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              if (_currentPage < 2) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => DefiningPage(),
                ));
              }
            },
          ),
        ],
      ),
    ],
  ),
),
        ],
      ),
    );
  }
}