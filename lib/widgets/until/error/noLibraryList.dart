
/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-08-05                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoLibrary extends StatefulWidget {
  const NoLibrary({super.key});
  @override
  State<NoLibrary> createState() => _NoLibraryState();
}

class _NoLibraryState extends State<NoLibrary> {
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
              Lottie.asset('assets/animation_lk9jjsre.json', height: 200, width: 200),
              const AutoSizeText('К сожалению, здесь ничего нет', maxLines: 2,),
              const AutoSizeText('Но вы можете стать первым и опубликовать свою историю', maxLines: 3, maxFontSize: 13, minFontSize: 13,),
            ],
          )
        ],
      ),
    );
  }
}