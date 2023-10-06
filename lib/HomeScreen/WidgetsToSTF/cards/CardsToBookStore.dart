import 'package:flutter/material.dart';

class CardsToBookStore extends StatefulWidget {
  const CardsToBookStore({super.key,
  required this.title,
    // required this.image,
    required this.author,
    required this.rating,
    required this.genre, 
  
  
  });
  final String title;
  // String image;
  final String author;
  final int rating;
  final String genre; 

  @override
  State<CardsToBookStore> createState() => _CardsToBookStoreState();
}

class _CardsToBookStoreState extends State<CardsToBookStore> {
 @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.amber,
          ),
          Text(widget.title, maxLines: 2, style: Theme.of(context).primaryTextTheme.bodyText2,),
          Text(widget.author, maxLines: 2, style: Theme.of(context).textTheme.bodyText1,),
          Row(
            children: List.generate(5, (index) => Icon(Icons.star, size: 18, color: widget.rating <= index? Colors.grey:Theme.of(context).highlightColor,)),
          )
        ],
      ),
    ),
  );
}
}