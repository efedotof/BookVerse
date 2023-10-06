import 'package:flutter/material.dart';

class MyBookCard extends StatefulWidget {
  const MyBookCard({super.key});

  @override
  State<MyBookCard> createState() => _MyBookCardState();
}

class _MyBookCardState extends State<MyBookCard> {
  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      width: 125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.amber,
          ),
          Text(
            'widget.title sadasdasdasd',
            maxLines: 3,style: Theme.of(context).primaryTextTheme.bodyText2
          ),
          Text('widget.author', maxLines: 2, style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(height: 15), 
          LinearProgressIndicator(
            value: 30 / 100,
            
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFDEB579)),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
}