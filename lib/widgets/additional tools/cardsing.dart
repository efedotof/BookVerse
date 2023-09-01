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


// ignore: camel_case_types
class cards extends StatefulWidget {
  const cards({
    super.key,
    required this.name,
    required this.author,
    required this.genre,
    // ignore: non_constant_identifier_names
    required this.image_netvorsk,
    
  });
  // ignore: non_constant_identifier_names
  final String image_netvorsk;
  final String name;
  final String author;
  final String genre;
  @override
  State<cards> createState() => _cardsState();
}

// ignore: camel_case_types
class _cardsState extends State<cards> {


  String getStringName(String string){
    if(string.length > 10){
      String text = capitalizeWords( string.substring(0, 10).toLowerCase() + '...');
      return text;
    }else{return capitalizeWords(string);}
  }
  String capitalizeWords(String input) {
  List<String> words = input.split(' ');
  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }
  }
  return words.join(' ');
}

  String getStringTitle(String string){
    if(string.length > 10){
      String text =  string.substring(0, 10).toLowerCase() + '...';
      return text;
    }else{return string;}
  }
  





@override
Widget build(BuildContext context) {
  return Container(
    color: Colors.transparent,
    height: 400,
    width: 150,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          // Align the image at the top center
          Align(
            alignment: Alignment.topCenter,
            child: widget.image_netvorsk.startsWith('http')
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      widget.image_netvorsk,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      widget.image_netvorsk,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
          ),
          Positioned(
            bottom: 0, // Position at the bottom
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(getStringName(widget.author), maxLines: 2),
                Text(getStringTitle(widget.name), maxLines: 1),
                Text(getStringTitle(widget.genre), maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


}

/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/