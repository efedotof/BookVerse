/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-07-29                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************

import 'dart:html';

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