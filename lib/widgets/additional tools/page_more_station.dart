import 'package:flutter/material.dart';

import 'list_data_text.dart';

class More_pages extends StatefulWidget {
  const More_pages({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<More_pages> createState() => _More_pagesState();
}

class _More_pagesState extends State<More_pages> {
  late String text;

  @override
  void initState() {
    for(int i=0; i < categories_name.length;i++ ){
      if(text == categories_name[i]){
        
      }
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}