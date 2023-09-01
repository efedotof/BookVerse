import 'package:flutter/material.dart';

class ButtosMenu extends StatefulWidget {
  const ButtosMenu({super.key,
  required this.icons,
  required this.actions,
  required this.text,
  required this.mode
  
  
  });
  final String text;
  final void actions;
  final IconData? icons;
  final bool mode;

  @override
  State<ButtosMenu> createState() => _ButtosMenuState();
}

class _ButtosMenuState extends State<ButtosMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: TextButton(onPressed: () {
        widget.actions;
      },
      child: Row(
        children: [
          const SizedBox(width: 50,),
          Icon(widget.icons, color: Colors.grey.shade600,),
          const SizedBox(width: 10,),
          Text(widget.text, style: TextStyle(fontWeight: FontWeight.w300, color: widget.mode?Colors.white:Colors.grey.shade900,),),
        ],
      )),
    );
  }
}
