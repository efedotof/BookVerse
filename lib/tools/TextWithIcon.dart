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
import 'package:flutter/cupertino.dart';

class TextWithIcon extends StatelessWidget {
   const TextWithIcon({super.key,
    required this.icon,
    required this.text,
    required this.spacing,
  });
  final IconData icon;
  final String text;
  final double spacing;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(height: spacing),
          Text(text),
        ],
      ),
    );
  }
}