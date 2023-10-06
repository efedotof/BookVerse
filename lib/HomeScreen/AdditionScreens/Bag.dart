import 'package:flutter/material.dart';
import 'package:readerabooks/HomeScreen/WidgetsToSTF/cards/CardsToBookStore.dart';

class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('My Bag', style:  Theme.of(context).primaryTextTheme.bodyText1),
          ),
           Wrap(
            children: List.generate(30, (index) {
             
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardsToBookStore(
                    title: 'card.title',
                    rating: 5,
                    genre: 'card.genre',
                    author: "Me",
                  ),
                );
            }),
          )
        ],
      ),
    );
  }
}