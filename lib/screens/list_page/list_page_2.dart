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
import 'package:magazine/widgets/additional%20tools/block_more.dart';
import 'package:magazine/widgets/until/Textheader.dart';
import 'package:magazine/widgets/until/error/noLibraryList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/additional tools/cards_reade_todo.dart';
import '../../list_data_text.dart';
import '../../widgets/until/AddFile.dart';

class List_views_2 extends StatefulWidget {
  const List_views_2(
      {super.key, required this.isConnected, required this.isTechnical, required this.mode});
  final bool isConnected;
  final bool isTechnical;
  final bool mode;
  static _List_views_2State? of(BuildContext context) {
    return context.findAncestorStateOfType<_List_views_2State>();
  }

  @override
  State<List_views_2> createState() => _List_views_2State();
}

// ignore: camel_case_types
class _List_views_2State extends State<List_views_2> {
  // ignore: non_constant_identifier_names
  bool ShowAddFiles = false;
  bool pushMyBook = false;

  @override
  void initState() {
    super.initState();
    getPrefs();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.mode? const Color.fromARGB(96, 43, 42, 42):Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Textheader(text: 'Моя Библиотека', modes: widget.mode,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color:widget.mode? const Color.fromARGB(96, 43, 42, 42):Colors.white, 
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                initShowAddFiles();
                              },
                              icon: const Icon(
                                Icons.menu,
                                size: 17,
                              ),
                              color: widget.mode? Colors.white:Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.mode? Colors.black:Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                      boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: extraNameChild.isNotEmpty
                      ? SizedBox(
                          height: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              if (extraNameChild.isNotEmpty)
                                for (int i = 0; i < extraNameChild.length; i++)
                                  i == 0
                                      ? cards_recs(
                                          name: extraNameChild[
                                              (extraNameChild.length - 1) - i],
                                          image: extraimgChild[
                                              (extraimgChild.length - 1) - i],
                                          author: extraAuthorChild[
                                              (extraAuthorChild.length - 1) -
                                                  i],
                                          genre: extraGenreChild[
                                              (extraGenreChild.length - 1) - i],
                                          text: extraTextChild[
                                              (extraTextChild.length - 1) - i],
                                        )
                                      : i == 1
                                          ? cards_todo(
                                              name: extraNameChild[
                                                  (extraNameChild.length - 1) -
                                                      i],
                                              image: extraimgChild[
                                                  (extraimgChild.length - 1) -
                                                      i],
                                              author: extraAuthorChild[
                                                  (extraAuthorChild.length -
                                                          1) -
                                                      i],
                                              genre: extraGenreChild[
                                                  (extraGenreChild.length - 1) -
                                                      i],
                                              text: extraTextChild[
                                                  (extraTextChild.length - 1) -
                                                      i],
                                            )
                                          : cards_todo_list(
                                              name: extraNameChild[
                                                  (extraNameChild.length - 1) -
                                                      i],
                                              image: extraimgChild[
                                                  (extraimgChild.length - 1) -
                                                      i],
                                              author: extraAuthorChild[
                                                  (extraAuthorChild.length -
                                                          1) -
                                                      i],
                                              genre: extraGenreChild[
                                                  (extraGenreChild.length - 1) -
                                                      i],
                                              text: extraTextChild[
                                                  (extraTextChild.length - 1) -
                                                      i],
                                            )
                            ],
                          ),
                        )
                      : const SizedBox(
                          height: 300,
                          child: Center(
                            child: AutoSizeText(
                              "Здесь появится ваша история",
                              minFontSize: 18,
                              maxLines: 2,
                            ),
                          ),
                        ),
                        ),
                        const SizedBox(
                  height: 30,
                ),
                widget.isConnected? SizedBox(
                    child: block_more(
                  isConnected: widget.isConnected,
                  isTechnical: widget.isTechnical,
                )): NoLibrary()
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          
          // if (ShowAddFiles) const AddFile(),
          IgnorePointer(
            ignoring: !ShowAddFiles,
            child: AnimatedOpacity(opacity: ShowAddFiles ? 1.0 : 0.0, duration: const Duration(milliseconds: 500), child:const AddFile() ,),
          )
        ],
      ),
    );
  }

  void initShowAddFiles() {
    setState(() {
      ShowAddFiles = !ShowAddFiles;
    });
  }

  void initPushMyBook() {
    setState(() {
      pushMyBook = !pushMyBook;
    });
  }
}
