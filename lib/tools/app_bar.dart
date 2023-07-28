import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  const appBar({super.key,
    required this.title,
    required this.mode,
  });
  final String title;
  final bool mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color:mode? Colors.black:Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(title,style: TextStyle(color: mode? Colors.white:Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
