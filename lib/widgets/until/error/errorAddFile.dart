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

/// *****************************************


class ErrorAddFile extends StatefulWidget {
  const ErrorAddFile({super.key});

  @override
  State<ErrorAddFile> createState() => _ErrorAddFileState();
}

class _ErrorAddFileState extends State<ErrorAddFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Lottie
              const Text('Что-то пошло не так...'),
            ],
          )
        ],
      ),
    );
  }
}