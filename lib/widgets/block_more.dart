
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';



class block_more extends StatefulWidget {
  const block_more({super.key});

  @override
  State<block_more> createState() => _block_moreState();
}

class _block_moreState extends State<block_more> {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Container(
      color: Color.fromARGB(227, 234, 229, 229),
      height: 300,
      padding: EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Еще", style: TextStyle(fontSize: 20),),
            ),
          ),
          Container(
            
            height: 100,
            width: 300,
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(31, 157, 157, 157),
            ),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const AutoSizeText(
                      'Художественная литература',
                      style: TextStyle(fontSize: 17),
                      maxLines: 2,
                    ),
                  ),
                  Image.asset('assets/image_templets_books.jpg', fit: BoxFit.fill,),
                ],
              ),
            )
          ),
          Container(
            decoration: BoxDecoration(
              color:const Color.fromARGB(31, 157, 157, 157), 
              borderRadius: BorderRadius.circular(10),
            ),
            
            height: 100,
            width: 300,
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const AutoSizeText(
                      'Романтика',
                      style: TextStyle(fontSize: 17),
                      maxLines: 2,
                    ),
                  ),
                  Image.asset('assets/image_templets_books.jpg', fit: BoxFit.fill,),
                ],
              ),
          ),
          Container(),
        ],
      ),
    ),
  );
  }
}
