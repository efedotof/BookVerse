import 'package:flutter/material.dart';

Widget cards_todo(BuildContext context){
  return Container(
    width: 150,
    height: 400,
    
     decoration: BoxDecoration(
  ),
    child: Card(
       elevation: 0,
      child: Column(
        children: [
          Container(
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: Center(child: Text("Текущее")),
           ), 
          Container(
            height: 200 - 45,
            width: 150,
            child: IconButton(
                  onPressed: (){
                    null;
                  },
                  icon: Image.asset('assets/image_templets_books.jpg', fit: BoxFit.fill,),
                ),
          ),
          Container(
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: Center(child: Text("name")),
           ), 
        ],
      ),
      
    ),
  );
}