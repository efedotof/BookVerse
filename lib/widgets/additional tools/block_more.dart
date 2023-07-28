
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
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(227, 234, 229, 229),
        ),
        
        height: 300,
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Статус'),
            ),
           
             Padding(
              padding: const EdgeInsets.only(top: 10),
             child: 
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                Text('Братья и Сестры ...'),
                Text('12.03.24'),
                Text('Опубликовано', style: TextStyle(color:Colors.green),),
              ],),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 10),
               child: 
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                Text('Братья и Сестры ...'),
                Text('12.03.24'),
                Text('Не опубликовано', style: TextStyle(color:Colors.redAccent),),
              ],),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 10),
               child: 
             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                Text('Братья и Сестры ...'),
                Text('12.03.24'),
                Text('На расмотрении', style: TextStyle(color:Colors.orange),),
              ],),
             ),
          ],
        ),
      ),
    ),
  );
  }
}
