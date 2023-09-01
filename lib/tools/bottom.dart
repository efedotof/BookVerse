/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-07-29                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: camel_case_types
class bottom extends StatefulWidget {
  const bottom({super.key,
    required this.start,
    required this.end,
    required this.mode,

  });
    final int start;
    final int end;
    final bool mode;

  @override
  State<bottom> createState() => _bottomState();
}

// ignore: camel_case_types
class _bottomState extends State<bottom> {
  String currentTime = '';
  NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");
  @override
  void initState() {
    super.initState();
    _getCurrentTime();
  }

    void _getCurrentTime() {
      
      String formattedTime = DateFormat('HH:mm').format(DateTime.now());
      setState(() {
        currentTime = formattedTime;
      });
      Future.delayed(const Duration(seconds: 1), _getCurrentTime);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color:widget.mode?Colors.black:Colors.white,
      width: MediaQuery.of(context).size.width,
      child: 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Text("${widget.start} / ${widget.end}     ${numberFormat.format((widget.start / widget.end) * 100)} %",style: TextStyle(color:widget.mode?Colors.white:Colors.black),),
            Text(currentTime,style: TextStyle(color:widget.mode?Colors.white:Colors.black),),
          ],
        ),
     
    );
  }
}


