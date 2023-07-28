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