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