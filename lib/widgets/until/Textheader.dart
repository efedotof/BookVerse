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
/********************************************/
import 'package:flutter/material.dart';

class Textheader extends StatefulWidget {
  const Textheader({super.key,
    required this.text,
  
  });
    final String text;
  @override
  State<Textheader> createState() => _TextheaderState();
}

class _TextheaderState extends State<Textheader> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),);
  }
}