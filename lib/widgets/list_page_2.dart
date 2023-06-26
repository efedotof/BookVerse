import 'package:flutter/material.dart';

import 'cardsing.dart';

Widget List_views_2(BuildContext context){
  return 
      Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          padding: EdgeInsets.all(25),
          children: List.generate(20, (index){
            return Container(
              height: 300,
              width: 150,
              child: cards(context),
            ); 
          }),
          
        ),
      );
}