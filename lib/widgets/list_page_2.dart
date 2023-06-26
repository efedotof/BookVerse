import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'cardsing.dart';

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
      Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: colimns,
          padding: EdgeInsets.all(13),
          children: List.generate(20, (index){
            return Card(
                    child: Container(
                      height: 290,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                  
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.asset('assets/image_templets_books.jpg', fit: BoxFit.fill,)
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          }),
          
        ),
      );
}