import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:magazine/tools/pagination.dart';
import 'package:magazine/tools/reader.dart';
import '../list_page/list_page_1.dart';
import 'list_data_text.dart';
import 'package:shared_preferences/shared_preferences.dart';


class cards extends StatefulWidget {
  const cards({super.key,
    required this.books,
    required this.indexs,
    required this.image_netvorsk,
  });
  final List books;
  final int indexs;
  final String image_netvorsk;
  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: (){
      List_views.of(context)!.init_isShowDescription();
    },
    child: Container(
      height: 400,
          width: 150,
      child: Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          
          color: Colors.transparent,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  '${widget.image_netvorsk}', // Здесь можно указать URL вашего изображения
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Text("Автор"),
              Text("Название"),
              Text("Жанр"),
            ],
          ),
        ),
      ),
    ),
  );

  }
}

