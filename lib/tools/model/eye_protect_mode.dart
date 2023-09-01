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
import 'package:flutter/services.dart';

class EyeProtectionOverlay extends StatefulWidget {
  const EyeProtectionOverlay({super.key,
  required this.showOverlay});

  final bool showOverlay;

  @override
  State<EyeProtectionOverlay> createState() => _EyeProtectionOverlayState();
}

class _EyeProtectionOverlayState extends State<EyeProtectionOverlay> {
  
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3, // Здесь можешь изменить уровень прозрачности (от 0.0 до 1.0)
      child: Material(
        color: Colors.yellow[50], // Цвет, который будет накладываться поверх экрана
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}