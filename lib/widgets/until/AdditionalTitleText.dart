
// ignore_for_file: file_names

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

class AdditionalTitleText extends StatefulWidget {
  const AdditionalTitleText({super.key,
    required this.text,
  });
  final String text;

  @override
  State<AdditionalTitleText> createState() => _AdditionalTitleTextState();
}

class _AdditionalTitleTextState extends State<AdditionalTitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text, style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),);
  }
}