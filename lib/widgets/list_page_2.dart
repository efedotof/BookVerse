import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;


import 'block_more.dart';
import 'cards_reade_todo.dart';
import 'list_data_text.dart';


class List_views_2 extends StatefulWidget {
  const List_views_2({super.key});

  @override
  State<List_views_2> createState() => _List_views_2State();
}

class _List_views_2State extends State<List_views_2> {
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
  @override
  Widget build(BuildContext context) {
   rows_colst();
  return 
      NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: const Text('Читаю сейчас', style: TextStyle(color: Colors.black),),
          expandedHeight: 40,
          toolbarHeight:40,
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
            child: extraNameChild.length != 0? Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                    if(extraNameChild.length != 0)for(int i =0; i < extraNameChild.length;i++) i == 0? cards_recs(name: extraNameChild[(extraNameChild.length - 1) - i],image: extraimgChild[(extraimgChild.length - 1) - i],):i == 1? cards_todo(name: extraNameChild[(extraNameChild.length - 1) - i], image: extraimgChild[(extraimgChild.length - 1) - i],):cards_todo_list(name: extraNameChild[(extraNameChild.length - 1) - i],image: extraimgChild[(extraimgChild.length - 1) - i],)
                 ],
              ),
            ): Container(
              height: 300,
              child: Center(
                child: AutoSizeText("Здесь появиться ваша история", minFontSize: 18, maxLines: 2,),
              ),
            ),
          ),
        
          block_more(),
        ],
      ),
      
      );
  }
}

