import 'package:flutter/material.dart';
import 'package:magazine/widgets/until/search.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

import '../additional tools/cardsing.dart';
import '../additional tools/list_data_text.dart';
import '../until/AdditionalTitleText.dart';
import '../until/Textheader.dart';
import '../until/description.dart';

class List_views extends StatefulWidget {
  const List_views({super.key});
  static _List_viewsState? of(BuildContext context) {
    return context.findAncestorStateOfType<_List_viewsState>();
  }

  @override
  State<List_views> createState() => _List_viewsState();
}

class _List_viewsState extends State<List_views> {
  bool isShowDescription = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textheader(text: "Библиотека"),
              ),
              search(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AdditionalTitleText(text: "Новинки"),
              ),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < book_as_famali.length; i++)
                      cards(
                        books: book_as_famali,
                        indexs: i,
                        image_netvorsk:
                            "https://marketplace.canva.com/EADx4IPoPNo/1/0/1024w/canva-%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0-%D0%BA%D0%BD%D0%B8%D0%B3%D0%B8-%D0%B2-%D0%B6%D0%B0%D0%BD%D1%80%D0%B5-%D1%82%D1%80%D0%B8%D0%BB%D0%BB%D0%B5%D1%80%D0%B0-%D1%81-%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC-%D0%BC%D0%BE%D0%BD%D0%BE%D1%85%D1%80%D0%BE%D0%BC%D0%BD%D0%BE%D0%B9-%D1%84%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%B8-%D0%BB%D0%B5%D1%81%D0%B0-iRBldJ_jyLw.jpg",
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AdditionalTitleText(text: "Все книги"),
              ),
              //gridViews
              Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing:
                            16.0, // Increase this value to add more space between columns
                        mainAxisSpacing:
                            16.0, // Increase this value to add more space between rows
                      ),
                      itemCount:
                          book_as_famali.length, // Total number of items in the grid
                      shrinkWrap: true, // Disable scrolling of the GridView
                      itemBuilder: (context, index) {
                        // You can create a custom widget here for each grid item, similar to "cards"
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, bottom: 0), // Add padding around each item
                            child: Container(
                              height: 425,
                              child: cards(
                                books: book_as_famali,
                                indexs: index,
                                image_netvorsk:
                                    "https://marketplace.canva.com/EADx4IPoPNo/1/0/1024w/canva-%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0-%D0%BA%D0%BD%D0%B8%D0%B3%D0%B8-%D0%B2-%D0%B6%D0%B0%D0%BD%D1%80%D0%B5-%D1%82%D1%80%D0%B8%D0%BB%D0%BB%D0%B5%D1%80%D0%B0-%D1%81-%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC-%D0%BC%D0%BE%D0%BD%D0%BE%D1%85%D1%80%D0%BE%D0%BC%D0%BD%D0%BE%D0%B9-%D1%84%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%B8-%D0%BB%D0%B5%D1%81%D0%B0-iRBldJ_jyLw.jpg",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isShowDescription) const DescriptionBooks(),
        ],
      ),
    );
  }

  void init_isShowDescription() {
    setState(() {
      isShowDescription = !isShowDescription;
    });
  }
}
