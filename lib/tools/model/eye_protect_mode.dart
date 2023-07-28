import 'package:flutter/material.dart';

class EyeProtectionOverlay extends StatefulWidget {
  const EyeProtectionOverlay({super.key});

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