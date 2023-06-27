import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'cardsing.dart';

Widget List_views(BuildContext context){
  var list_name = ['Психология','Детективы','Книги для родителей','Любовь и личные отношения','Заработок','Топ 120','Художественная литература','Для родителей'];
  return NestedScrollView(
      // This builds the scrollable content above the body
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: const Text('Библиотека', style: TextStyle(color: Colors.black),),
          expandedHeight: 80,
          pinned: true,
          backgroundColor: Colors.white,
          forceElevated: innerBoxIsScrolled,
        ),
      ],
      // The content of the scroll view
      body:
  ListView.builder(itemCount: list_name.length,itemBuilder: (context, index) {
      
      return StickyHeader(
        header: Container(
          height: 50.0,
         
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${list_name[index]}',
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_right_alt_outlined)),

            ],
          ),
          
          
          
        ),
        content: Container(
        height: 270,
        
        child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < 10; i++) cards(context)
        ],
      ),
      ),
    );
    })
  );
  
}