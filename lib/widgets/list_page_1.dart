import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'cardsing.dart';
import 'list_data_text.dart';


class List_views extends StatefulWidget {
  const List_views({super.key});

  @override
  State<List_views> createState() => _List_viewsState();
}

class _List_viewsState extends State<List_views> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // This builds the scrollable content above the body
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: const Text('Библиотека', style: TextStyle(color: Colors.black),),
          expandedHeight: 40,
          toolbarHeight:40,
          pinned: true,
          backgroundColor: Colors.white,
          forceElevated: innerBoxIsScrolled,
        ),
      ],
      // The content of the scroll view
      body:ListView.builder(itemCount: categories_name.length,itemBuilder: (context, index) {
      return StickyHeader(
        header: Container(
          height: 50.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${categories_name[index]}',
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_right_alt_outlined)),
                ],
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
        ),
        content: Container(
            height: 270,
            child: ListView(
            scrollDirection: Axis.horizontal,
            children: [ //https://libking.ru/uploads/posts/books/120854.jpg
              if(categories_name[index] == "Заработок") for(int i = 0; i < 10; i++) cards(books:book_as_famali,indexs: i,image_netvorsk:"https://marketplace.canva.com/EADx4IPoPNo/1/0/1024w/canva-%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0-%D0%BA%D0%BD%D0%B8%D0%B3%D0%B8-%D0%B2-%D0%B6%D0%B0%D0%BD%D1%80%D0%B5-%D1%82%D1%80%D0%B8%D0%BB%D0%BB%D0%B5%D1%80%D0%B0-%D1%81-%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC-%D0%BC%D0%BE%D0%BD%D0%BE%D1%85%D1%80%D0%BE%D0%BC%D0%BD%D0%BE%D0%B9-%D1%84%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%B8-%D0%BB%D0%B5%D1%81%D0%B0-iRBldJ_jyLw.jpg"),
              if(categories_name[index] == "Психология") for(int i = 0; i < 10; i++) cards(books: book_as_famali,indexs: i,image_netvorsk:"https://marketplace.canva.com/EADx4IPoPNo/1/0/1024w/canva-%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0-%D0%BA%D0%BD%D0%B8%D0%B3%D0%B8-%D0%B2-%D0%B6%D0%B0%D0%BD%D1%80%D0%B5-%D1%82%D1%80%D0%B8%D0%BB%D0%BB%D0%B5%D1%80%D0%B0-%D1%81-%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC-%D0%BC%D0%BE%D0%BD%D0%BE%D1%85%D1%80%D0%BE%D0%BC%D0%BD%D0%BE%D0%B9-%D1%84%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%B8-%D0%BB%D0%B5%D1%81%D0%B0-iRBldJ_jyLw.jpg"),
              if(categories_name[index] == "Детективы") for(int i = 0; i < 10; i++) cards(books: book_as_famali,indexs: i,image_netvorsk:"https://marketplace.canva.com/EADzXwkR9nI/1/0/1003w/canva-%D0%BF%D0%BE%D0%B4%D0%B1%D0%B0%D0%B4%D1%80%D0%B8%D0%B2%D0%B0%D1%8E%D1%89%D0%B0%D1%8F-%D1%80%D0%BE%D0%BC%D0%B0%D0%BD%D1%82%D0%B8%D0%BA%D0%B0-%D0%BA%D0%BD%D0%B8%D0%B3%D0%B0-%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0-Rho_QtFlu_E.jpg"),
              if(categories_name[index] == "Книги для родителей") for(int i = 0; i < 10; i++) cards(books: book_as_famali,indexs: i,image_netvorsk:"https://cdn.img-gorod.ru/310x500/nomenclature/25/296/2529622.jpg"),
              if(categories_name[index] == "Любовь и личные отношения") for(int i = 0; i < 10; i++) cards(books: book_as_famali,indexs: i,image_netvorsk:"https://bmm.ru/upload/iblock/81d/ed3un3acd13yazgzuca1vil6ehg97npv.jpg"),
              if(categories_name[index] == "Топ 120") for(int i = 0; i < 10; i++) cards(books: book_as_famali,indexs: i,image_netvorsk:"https://cdn.eksmo.ru/v2/ITD000000000598493/COVER/cover1__w600.jpg"),
              if(categories_name[index] == "Художественная литература") for(int i = 0; i < 10; i++) cards(books:book_as_famali,indexs: i,image_netvorsk:"https://libking.ru/uploads/posts/books/120854.jpg"),
            ],
          ),
          )
      
    );
    })
  );
  }
}

