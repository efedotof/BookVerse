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


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:magazine/tools/pagination.dart';
import 'package:magazine/tools/reader.dart';
// ignore: camel_case_types
class cards_recs extends StatefulWidget {
  const cards_recs({super.key,
    required this.image,
    required this.name,
    required this.author,
    required this.genre,
    required this.text,
  });
  final String image;
  final String name;
  final String author;
  final String genre;
  final String text;

  @override
  State<cards_recs> createState() => _cards_recsState();
}

class _cards_recsState extends State<cards_recs> {
  String name ='';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shortenText();
  }
  void shortenText() {
    if (widget.name.length > 16) {
      name = capitalizeFirstLetter(widget.name.substring(0, 13).toLowerCase()) + '...';
    } else {
      name = capitalizeFirstLetter(widget.name.toLowerCase());
    }
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }


    void handlePressed(BuildContext context, text) {
    

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookReaders(
          size_heigth: MediaQuery.of(context).size.height,
          size_width: MediaQuery.of(context).size.width,
          // pages: splitText(text, 18, MediaQuery.of(context).size.width,
          //     MediaQuery.of(context).size.height - 40),
          title: widget.name, 
          theme: Colors.white,
          isLoading: false,
          text: text, 
          paddings: 16,
        ),
      ),
    );
  }

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
  return GestureDetector(
    onTap: (){
      handlePressed(context,widget.text);
    },
    child: SizedBox(
      height: 400,
          width: 150,
      child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          // Align the image at the top center
          Align(
            alignment: Alignment.topCenter,
            child: widget.image.startsWith('http')
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      widget.image,
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
                      widget.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
          ),
          Positioned(
            bottom: 0, 
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(getStringName(widget.author), maxLines: 2,),
                Text(getStringTitle(widget.name), maxLines: 1),
                Text(getStringTitle(widget.genre), maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    ),
    ),
  );
  }
}


// ignore: camel_case_types
class cards_todo extends StatefulWidget{
  const cards_todo({super.key,
    required this.image,
    required this.name,
    required this.author,
    required this.genre,
    required this.text,
  });
  final String image;
  final String name;
  final String author;
  final String genre;
  final String text;

  @override
  State<cards_todo> createState() => _cards_todoState();
}

class _cards_todoState extends State<cards_todo> {
   String name ='';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shortenText();
  }
  void shortenText() {
    if (widget.name.length > 16) {
      name = capitalizeFirstLetter(widget.name.substring(0, 13).toLowerCase()) + '...';
    } else {
      name = capitalizeFirstLetter(widget.name.toLowerCase());
    }
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

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
  



  void handlePressed(BuildContext context, text) {
    

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookReaders(
          size_heigth: MediaQuery.of(context).size.height,
          size_width: MediaQuery.of(context).size.width,
          // pages: splitText(text, 18, MediaQuery.of(context).size.width,
          //     MediaQuery.of(context).size.height - 40),
          title: widget.name, 
          theme: Colors.white,
          isLoading: false,
          text: text, 
          paddings: 16,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: (){
      handlePressed(context, widget.text);
    },
    child: SizedBox(
      height: 400,
          width: 150,
      child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          // Align the image at the top center
          Align(
            alignment: Alignment.topCenter,
            child: widget.image.startsWith('http')
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      widget.image,
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
                      widget.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
          ),
          Positioned(
            bottom: 0, 
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
    ),
  );
  }
}
// ignore: camel_case_types
class cards_todo_list extends StatefulWidget {
  const cards_todo_list({super.key,
    required this.image,
    required this.name,
    required this.author,
    required this.genre,
    required this.text,
  });
  final String image;
  final String name;
  final String author;
  final String genre;
  final String text;

  @override
  State<cards_todo_list> createState() => _cards_todo_listState();
}

class _cards_todo_listState extends State<cards_todo_list> {
   String name ='';


  @override
  void initState() {
    super.initState();
    shortenText();
  }
  void shortenText() {
    if (widget.name.length > 16) {
      name = capitalizeFirstLetter(widget.name.substring(0, 13).toLowerCase()) + '...';
    } else {
      name = capitalizeFirstLetter(widget.name.toLowerCase());
    }
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }


  void handlePressed(BuildContext context, text) {
    List<String> lines = text.split('\n');
    String author = lines[0];
    String title = lines[1];

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookReaders(
          size_heigth: MediaQuery.of(context).size.height,
          size_width: MediaQuery.of(context).size.width,
          // pages: splitText(text, 18, MediaQuery.of(context).size.width,
          //     MediaQuery.of(context).size.height - 40),
          title: title + author, 
          theme: Colors.white,
          isLoading: false,
          text: text, 
          paddings: 16,
        ),
      ),
    );
  }

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
  return GestureDetector(
    onTap: (){
      handlePressed(context, widget.text);
    },
    child: SizedBox(
      height: 400,
          width: 150,
      child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          // Align the image at the top center
          Align(
            alignment: Alignment.topCenter,
            child: widget.image.startsWith('http')
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      widget.image,
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
                      widget.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
          ),
          Positioned(
            bottom: 0, 
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
    ),
  );
  }
}
/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/