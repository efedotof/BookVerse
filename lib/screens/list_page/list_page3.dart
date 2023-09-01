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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magazine/list_data_text.dart';
import 'package:magazine/tools/reader.dart';
import 'package:magazine/widgets/additional%20tools/cardsing.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:magazine/widgets/until/Textheader.dart';
import 'package:magazine/widgets/until/error/ServisTech.dart';
import 'package:magazine/widgets/until/error/noConnection.dart';
import 'package:magazine/widgets/until/error/noLibraryList.dart';

import '../../widgets/until/menu/menu.dart';

//search_page

class search_page extends StatefulWidget {
  const search_page({
    super.key,
    required this.name,
    required this.email,
    required this.nickname,
    required this.uid,
    required this.mode,
    required this.isConnected,
  });
final bool isConnected;
  final String? name;
  final String? email;
  final String? nickname;
  final String? uid;
  final bool mode;

  static _search_pageState? of(BuildContext context) {
    return context.findAncestorStateOfType<_search_pageState>();
  }

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  bool _showMenu = false;

  void showMenuState() {
    setState(() {
      _showMenu = !_showMenu;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? image_URL;

  List<String> currentNamesKIK = <String>[];
  List<String> currentTextKIK = <String>[];
  List<String> currentImageKIK = <String>[];
  List<String> currentGenger = <String>[];
  List<String> currentAuthor = <String>[];
  List<String> currentDescriptions = <String>[];
  List<String> currentStatusKIK = [];

  List<String> LibraryName = [];
  List<String> LibraryAuthor = [];
  List<String> LibraryGender = [];
  List<String> LibraryImage = [];
  List<String> LibraryText = [];



  void handleUpDown(BuildContext context,text, author,name)  {
      try {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookReaders(
          size_heigth: MediaQuery.of(context).size.height,
          size_width: MediaQuery.of(context).size.width,
          // pages: splitText(
          //     text, 18, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 40),
          title:name +' ' + author,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.mode?Colors.black:Colors.white ,
      body:widget.isConnected? boolIsTechnicalWords == false
          ?  Stack(
              children: [
                SingleChildScrollView(
                  child:  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Textheader(
                                text: 'Мой профиль', modes: widget.mode,
                              ),
                              Center(
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: widget.mode? Colors.black:Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        showMenuState();
                                      },
                                      icon: const Icon(
                                        Icons.menu,
                                        size: 16,
                                      ),
                                      color: widget.mode? Colors.white:Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.blueAccent.shade100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blue.shade100,
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          // child: StreamBuilder(
                                          //   stream: FirebaseFirestore.instance
                                          //       .collection('users')
                                          //       .doc(widget.uid)
                                          //       .collection('images')
                                          //       .snapshots(),
                                          //   builder: (BuildContext context,
                                          //       AsyncSnapshot<QuerySnapshot>
                                          //           snapshot) {
                                          //     if (snapshot.connectionState ==
                                          //         ConnectionState.waiting) {
                                          //       return const Center(
                                          //         child: CircularProgressIndicator(),
                                          //       );
                                          //     } else if (!snapshot.hasData ||
                                          //         snapshot.data == null) {
                                          //       return const Center(
                                          //         child: Text(' '),
                                          //       );
                                          //     } else {
                                          //       if (snapshot
                                          //           .data!.docs.isEmpty) {
                                          //         return const Center(
                                          //           child: Text(' '),
                                          //         );
                                          //       }

                                          //       image_URL = snapshot.data!.docs[snapshot.data!.docs.length -1]['URL'];


                                          //       return ClipOval(

                                          //         // child: Container(color: Colors.blue,),
                                          //           child:snapshot.data!.docs[snapshot
                                          //                 .data!.docs.length -
                                          //             1]['URL'] != null? Image.network(
                                          //         snapshot.data!.docs[snapshot
                                          //                 .data!.docs.length -
                                          //             1]['URL'],
                                          //         height: 140,
                                          //         width: 140,
                                          //         fit: BoxFit.cover,
                                          //       ): Container(color:Colors.blue)
                                                
                                          //       );
                                          //     }
                                          //   },
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // right
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.name.toString()),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(widget.nickname.toString()),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(widget.email.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Мои публикации')),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: widget.mode? Colors.black:Colors.white,
                                borderRadius: BorderRadius.circular(30),
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
                                  const SizedBox(height: 20,),
                                  // StreamBuilder<DocumentSnapshot>(
                                  //     stream: firestore
                                  //         .collection('AdminPanel')
                                  //         .doc(Auth().getUIDManager())
                                  //         .snapshots(),
                                  //     builder: (context, snapshot) {
                                  //       if (snapshot.connectionState ==
                                  //           ConnectionState.waiting) {
                                  //         return Center(
                                  //             child: Container(
                                  //                 color: Colors.transparent,
                                  //                 height: 80,
                                  //                 width: 80,
                                  //                 child:
                                  //                     CircularProgressIndicator()));
                                  //       } else if (snapshot.hasError) {
                                  //         print(snapshot.error);
                                  //         return Text('Error fetching data');
                                  //       } else if (!snapshot.hasData ||
                                  //           snapshot.data == null) {
                                  //         // Check for null data
                                  //         // return ErrorConnection();
                                  //         return Text(' ');
                                  //       } else {
                                  //         Map<String, dynamic>? data =
                                  //             snapshot.data!.data() as Map<String,
                                  //                 dynamic>?; // Use nullable type
                                  //         if (data == null) {
                                  //           return NoLibrary();
                                  //         }
                                  //         currentNamesKIK =
                                  //             List<String>.from(data['name'] ?? []);
                                  //         currentDataKIK =
                                  //             List<String>.from(data['data'] ?? []);
                                  //         currentStatusKIK = List<String>.from(
                                  //             data['status'] ?? []);
                                  //         currentTextKIK =
                                  //             List<String>.from(data['text'] ?? []);
                                  //         currentImageKIK = List<String>.from(
                                  //             data['image'] ?? []);
                                  //         currentAuthor = List<String>.from(
                                  //             data['author'] ?? []);
                                  //         currentGenger = List<String>.from(
                                  //             data['genger'] ?? []);
                                  //         currentDescriptions = List<String>.from(
                                  //             data['description'] ?? []);
                                  //         int minLength = currentNamesKIK.length;
                                  //         if (currentDataKIK.length < minLength)
                                  //           minLength = currentDataKIK.length;
                                  //         if (currentAuthor.length < minLength)
                                  //           minLength = currentAuthor.length;
                                  //         if (currentNamesKIK.length < minLength)
                                  //           minLength = currentNamesKIK.length;
                                  //         if (currentGenger.length < minLength)
                                  //           minLength = currentGenger.length;
                                  //         if (currentImageKIK.length < minLength)
                                  //           minLength = currentImageKIK.length;
                                  //         if (currentStatusKIK.length < minLength)
                                  //           minLength = currentStatusKIK.length;
                                  //         if (minLength == 0) {
                                  //           return NoLibrary();
                                  //         }
                                  //         List<Widget> itemList = [];

                                  //         for (int index = 0;
                                  //             index < minLength;
                                  //             index++) {
                                  //           if (currentStatusKIK[
                                  //                   (currentStatusKIK.length - 1) -
                                  //                       index] ==
                                  //               'Опубликовано') {

                                  //             itemList.add(GestureDetector(
                                  //               onTap: (){
                                  //                 handleUpDown(context,currentTextKIK[(currentTextKIK.length - 1) - index],currentAuthor[(currentAuthor.length - 1) - index],currentNamesKIK[(currentNamesKIK.length - 1) - index] );
                                  //               },
                                  //               child: Container(
                                  //                 color: Colors.transparent,
                                  //                 width: 150,
                                  //                 height: 303,
                                  //                 child: cards(
                                  //                     name: currentNamesKIK[
                                  //                         (currentNamesKIK.length -
                                  //                                 1) -
                                  //                             index],
                                  //                     author: currentAuthor[
                                  //                         (currentAuthor.length - 1) -
                                  //                             index],
                                  //                     genre: currentGenger[
                                  //                         (currentGenger.length - 1) -
                                  //                             index],
                                  //                     image_netvorsk: currentImageKIK[(currentImageKIK.length -1) -index] != '' ?currentImageKIK[(currentImageKIK.length -1) -index] : 'assets/elseNoConnection.jpg' ,
                                  //                             ),
                                                              
                                  //               ),
                                  //             ));
                                  //           }
                                  //         }
                                  //         if (itemList.length == 0) {
                                  //           return NoLibrary();
                                  //         }
                                  //         return Wrap(
                                  //           direction: Axis.horizontal, 
                                  //           spacing: 16.0, 
                                  //           children: itemList,
                                  //         );
                                  //       }
                                  //     }),
                                ],
                              )),
                        ),
                      ),
                    ],
                  )
                ),
                // if (_showMenu) MenuShow(name_person: widget.name!, email: widget.email!, image: image_URL!, )
                if(_showMenu) MenuShow(name_person: widget.name != null? widget.name! : "", email: widget.email!= null?widget.email!:"", image: image_URL!= null? image_URL!: "", mode: widget.mode,)
                // if (_showMenu) // Remove the MenuShow widget from here
                //   Positioned(
                //     bottom: 0,
                //     left: 0,
                //     right: 0,
                //     child: Container(
                //       color: Colors.white,
                //       child: MenuShow(
                //         name_person: widget.name != null ? widget.name! : "",
                //         email: widget.email != null ? widget.email! : "",
                //         image: image_URL != null ? image_URL! : "",
                //       ),
                //     ),
                //   ),
              ],
            )
          : const ErrorServisTech() : Container()
    );
  }
}
