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

import 'package:flutter/material.dart';

// ignore: camel_case_types
class appBar extends StatefulWidget {
  const appBar({super.key,
    required this.title,
    required this.mode,
  });
  final String title;
  final bool mode;

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  String TitleName = '';
  void shortenText() {
    if (widget.title.length > 30) {
      TitleName = capitalizeFirstLetter(widget.title.substring(0, 30).toLowerCase()) + '...';
    } else {
      TitleName = capitalizeFirstLetter(widget.title.toLowerCase());
    }
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    shortenText();
    return Container(
      height: 40,
      color:widget.mode? Colors.black:Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(TitleName,style: TextStyle(color: widget.mode? Colors.white:Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
