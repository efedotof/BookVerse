/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-07-30                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// *****************************************




class ErrorServisTech extends StatefulWidget {
  const ErrorServisTech({super.key});

  @override
  State<ErrorServisTech> createState() => _ErrorServisTechState();
}

class _ErrorServisTechState extends State<ErrorServisTech> {

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animation_lk9jhoj4.json',height: 200, width: 200),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const Text('Попробуйте позже... Ведутся технические работы'),
              ),
            ],
          )
        ],
      ),
    );
  }
}