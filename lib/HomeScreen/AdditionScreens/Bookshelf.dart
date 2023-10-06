import 'package:flutter/material.dart';

import 'package:readerabooks/HomeScreen/WidgetsToSTF/cards/CardsToBookShelf.dart';
import 'package:readerabooks/HomeScreen/WidgetsToSTF/cards/MyBooks.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({super.key});

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('My Book', style:  Theme.of(context).primaryTextTheme.bodyText1),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, 
            child: Wrap(
              direction: Axis.horizontal,
              children: 
                List.generate(10, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyBookCard(),
                )),
            
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Wishlisted Books', style:Theme.of(context).primaryTextTheme.bodyText1),
          ),

          Wrap(
            children: List.generate(30, (index) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CardsToBookShelf(),
            ))
          )
        ],
      ),
    );
  }
}