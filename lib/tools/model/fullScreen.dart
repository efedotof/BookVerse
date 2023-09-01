import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreenMode extends StatefulWidget {
  const FullScreenMode({super.key,
    required this.showOverlay,
  });
  final bool showOverlay;

  @override
  State<FullScreenMode> createState() => _FullScreenModeState();
}

class _FullScreenModeState extends State<FullScreenMode> {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: widget.showOverlay ? SystemUiOverlay.values : [],
  );
    return Opacity(
      opacity: 0, // Здесь можешь изменить уровень прозрачности (от 0.0 до 1.0)
      child: Material(
        color: Colors.transparent, // Цвет, который будет накладываться поверх экрана
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}