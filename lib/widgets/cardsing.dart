import 'package:flutter/material.dart';

Widget cards(BuildContext context){
  return Container(
    width: 150,
    height: 300,
    child: Card(
      child: Image.asset('assets/image_templets_books.jpg', fit: BoxFit.fill,),
    ),
  );
}