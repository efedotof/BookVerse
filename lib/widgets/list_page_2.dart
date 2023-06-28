import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:magazine/widgets/cardsing.dart';

import 'cards_past.dart';
import 'cards_reade_todo.dart';
import 'cards_recent.dart';

int colimns = 2;

void rows_colst(){
  if (Platform.isAndroid) {
    colimns = 2;
  }
  else if(Platform.isLinux) {
    colimns = 4;
   
  }
  else if(Platform.isWindows) {
    colimns = 4;
    
  }
  else if(Platform.isIOS) {
    colimns = 2;
   
  }
  else if(Platform.isMacOS) {
    colimns = 4;
    
  }

}

Widget List_views_2(BuildContext context){
  rows_colst();
  return 
      NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: const Text('Читаю сейчас', style: TextStyle(color: Colors.black),),
          expandedHeight: 80,
          pinned: true,
          backgroundColor: Colors.white,
          forceElevated: innerBoxIsScrolled,
        ),
      ],
      // The content of the scroll view
      body:ListView(
        children: [
          Container(
            height: 1,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  cards_todo(context),
                  cards_recent(context),
          
                  for(int i =0; i < 20;i++) cards_past(context),
                ],
              ),
            ),
          ),
        ],
      ),
      
      );
}