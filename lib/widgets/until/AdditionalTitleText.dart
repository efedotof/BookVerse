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
    return Text(widget.text, style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),);
  }
}