import 'package:flutter/material.dart';
import 'package:magazine/screens/home.dart';
import 'package:magazine/screens/splashscreen.dart';


void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(244, 255, 255, 255)),
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreens(),
        '/Home':(context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    )
  );