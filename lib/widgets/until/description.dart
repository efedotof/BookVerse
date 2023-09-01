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
import 'package:magazine/list_data_text.dart';
import 'package:magazine/screens/list_page/list_page_1.dart';
import 'package:magazine/tools/pagination.dart';
import 'package:magazine/tools/reader.dart';
import 'package:shared_preferences/shared_preferences.dart';
   

class DescriptionBooks extends StatefulWidget {
  const DescriptionBooks({super.key,
    required this.name,
    required this.author,
    required this.image,
    required this.genger,
    required this.descriptions,
    required this.text,
  });


  final String name;
  final String author;
  final String descriptions;
  final String genger;
  final String image;
  final String text;


  @override
  State<DescriptionBooks> createState() => _DescriptionBooksState();
}

class _DescriptionBooksState extends State<DescriptionBooks> {


  void handleUpDown(BuildContext context,text, author,name, image, genger)  {
      try {
       
        extraNameChild.add(name);
        extraimgChild.add(image);
        extraTextChild.add(text);
        extraAuthorChild.add(author);
        extraGenreChild.add(genger);
        setPrefs();

    // Navigator.of(context).pop();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookReaders(
          size_heigth: MediaQuery.of(context).size.height,
          size_width: MediaQuery.of(context).size.width,
          // pages: splitText(
          //     text, 18, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 40),
          title: name,
          theme: Colors.white,
          isLoading: false,
          text: text,
          paddings: 16,
        ),
      ),
    );
  } catch (e) {
    print(" jib,rf nen $e");
  }



  


  }
  Future setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('nameHistory', extraNameChild);
    prefs.setStringList('imageHistory', extraimgChild);
    prefs.setStringList('TextHistory', extraTextChild);
    prefs.setStringList('AuthorHistory', extraAuthorChild);
    prefs.setStringList('GenreHistory', extraGenreChild);
  }


  Future getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      extraNameChild = prefs.getStringList('nameHistory') ?? <String>[];
      extraimgChild = prefs.getStringList('imageHistory') ?? <String>[];
      extraTextChild = prefs.getStringList('TextHistory') ?? <String>[];
      extraAuthorChild = prefs.getStringList('AuthorHistory') ?? <String>[];
      extraGenreChild = prefs.getStringList('GenreHistory') ?? <String>[];
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, 
      child: Column(
        children: [
          Expanded(child: GestureDetector(onTap: () {
            List_views.of(context)!.init_isShowDescription();
          },)),
          Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Image on the left
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                           
                          ),
                        ),
                      ),
                      // Details on the right
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(widget.name, style: TextStyle(fontSize: 18)),
                              const SizedBox(height: 8),
                              Text(widget.author, style: TextStyle(fontSize: 18)),
                              const SizedBox(height: 8),
                              Text(widget.genger, style: TextStyle(fontSize: 18)),
                              const SizedBox(height: 16),
                               Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    widget.descriptions,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  handleUpDown(context, widget.text, widget.author, widget.name,widget.image,widget.genger);
                                },
                                child: const Text('Читать сейчас'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
             
        ],
      ),
    );
  }
}