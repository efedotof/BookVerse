import 'package:flutter/material.dart';

import 'cardsing.dart';

Widget List_views(BuildContext context){
  return ListView(
    children: [
      Text("Психология"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
      Text("Детективы"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
      Text("Книги для родителей"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
      Text("Любовь и личные отношения"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
      Text("Топ 120"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
      Text("Заработок"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
      Text("Художественная литература"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
      Text("Для родителей"),
      Container(height: 40,),
      Container(
        height: 300,
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
    ],
  );
}