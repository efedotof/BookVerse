import 'package:flutter/material.dart';

class CardsToBookShelf extends StatefulWidget {
  const CardsToBookShelf({super.key});

  @override
  State<CardsToBookShelf> createState() => _CardsToBookShelfState();
}

class _CardsToBookShelfState extends State<CardsToBookShelf> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height *0.2,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
       
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text('Namespasing Booking hahah',maxLines: 3,style: Theme.of(context).primaryTextTheme.bodyText2)),
                    Text('Author', maxLines: 2, style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
                Row(
              children: List.generate(5, (index) => Icon(Icons.star, size: 18, color:  Colors.grey)),
            )
              ],
            )
          ],
        ),
      ),
    );
  }
}