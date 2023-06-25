import 'package:flutter/material.dart';
import 'package:magazine/screens/home.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(244, 255, 255, 255)),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    ));