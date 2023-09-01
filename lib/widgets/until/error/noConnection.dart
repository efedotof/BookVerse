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


class ErrorConnection extends StatefulWidget {
  const ErrorConnection({super.key});

  @override
  State<ErrorConnection> createState() => _ErrorConnectionState();
}

class _ErrorConnectionState extends State<ErrorConnection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation_lk9jgyk8.json', height: 200, width: 200, ),
                const Text('Нет подключения к интернету...'),
              ],
            )
          ],
        ),
      );
 
  }
}

