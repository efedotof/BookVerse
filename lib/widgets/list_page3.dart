import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
Widget search_page(BuildContext context){
  return NestedScrollView(
      // This builds the scrollable content above the body
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: const Text('App Bar'),
          expandedHeight: 200,
          pinned: true,
          forceElevated: innerBoxIsScrolled,
        ),
      ],
      // The content of the scroll view
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'Text $index',
          ),
        ),
      ),
    );
  // return ListView.builder(itemBuilder: (context, index) {
  //     return StickyHeader(
  //       header: Container(
  //         height: 50.0,
  //         color: Colors.blueGrey[700],
  //         padding: EdgeInsets.symmetric(horizontal: 16.0),
  //         alignment: Alignment.centerLeft,
  //         child: Text('Поиск',
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //       ),
  //       content: Container(
  //         child:Image.asset('assets/image_templets_books.jpg',
  //           fit: BoxFit.cover,
  //           width: double.infinity, 
  //           height: 200.0,
  //         ),
  //       ),
  //     );
  //   });
}