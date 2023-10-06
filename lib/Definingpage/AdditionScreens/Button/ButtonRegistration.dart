import 'package:flutter/material.dart';

class ButtonRegistration extends StatefulWidget {
  const ButtonRegistration({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;


  @override
  State<ButtonRegistration> createState() => _ButtonRegistrationState();
}

class _ButtonRegistrationState extends State<ButtonRegistration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF7666FB)
      ),
      child:TextButton(onPressed: (){widget.onPressed();}, child: Text(widget.text, style: TextStyle(color: Color(0xFFACACAF)),)),
    );
  }
}