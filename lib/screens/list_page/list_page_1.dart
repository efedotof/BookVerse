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

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magazine/widgets/until/error/noConnection.dart';
import 'package:magazine/widgets/until/error/noLibraryList.dart';
// import 'package:magazine/widgets/until/search.dart';
// import 'package:magazine/widgets/until/search_res.dart';

import '../../widgets/additional tools/cardsing.dart';
import '../../widgets/until/AdditionalTitleText.dart';
import '../../widgets/until/Textheader.dart';
import '../../widgets/until/description.dart';
import '../../widgets/until/error/ServisTech.dart';

// ignore: camel_case_types
class List_views extends StatefulWidget {
  const List_views(
      {super.key, required this.isConnected, required this.isTechnical, required this.mode});
  final bool isConnected;
  final bool isTechnical;
  final bool mode;

  // ignore: library_private_types_in_public_api
  static _List_viewsState? of(BuildContext context) {
    return context.findAncestorStateOfType<_List_viewsState>();
  }

  @override
  State<List_views> createState() => _List_viewsState();
}

// ignore: camel_case_types
class _List_viewsState extends State<List_views> {
  bool isShowDescription = false;
  bool isSearching = false;
  List<String> datas = [];
  List<String> filteredData = [];

  List<String> LibraryName = [];
  List<String> LibraryAuthor = [];
  List<String> LibraryGender = [];
  List<String> LibraryImage = [];
  List<String> LibraryText = [];
  List<String> LibraryDescription = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool boolIsTechnicalWords = false;

  String authors = '';
  String descriptions = '';
  String gengers = '';
  String images = '';
  String texts = '';
  String names = '';

  Future handleUpDown(author, description, genger, image, text, name) async {
    setState(() {
      authors = author;
      descriptions = description;
      gengers = genger;
      images = image;
      texts = text;
      names = name;
      isShowDescription = !isShowDescription;
    });
  }

  void startSearching() {
    setState(() {
      isSearching = true;
      filteredData.clear();
    });
  }

  void stopSearching() {
    setState(() {
      isSearching = false;
      filteredData.clear();
    });
  }



  void handleSearch(String query) {
    filteredData.clear();
    if (query.isEmpty) {
      setState(() {});
      return;
    }
    for (String item in datas) {
      if (_levenshteinDistance(item.toLowerCase(), query.toLowerCase()) <= 2) {
        filteredData.add(item);
      }
    }

    setState(() {});
  }

  int _levenshteinDistance(String a, String b) {
    if (a == b) {
      return 0;
    }

    if (a.isEmpty) {
      return b.length;
    }

    if (b.isEmpty) {
      return a.length;
    }

    List<int> previousRow =
        List<int>.generate(b.length + 1, (int index) => index);
    for (int i = 0; i < a.length; i++) {
      List<int> currentRow = List<int>.generate(b.length + 1, (index) => index);
      currentRow[0] = i + 1;

      for (int j = 0; j < b.length; j++) {
        int insertCost = currentRow[j] + 1;
        int deleteCost = previousRow[j + 1] + 1;
        int replaceCost = previousRow[j] + (a[i] == b[j] ? 0 : 1);

        currentRow[j + 1] = [insertCost, deleteCost, replaceCost].reduce(min);
      }

      previousRow = currentRow;
    }

    return previousRow[b.length];
  }

  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.mode? Colors.black:Colors.white,
      body: StreamBuilder<DocumentSnapshot>(
          stream:
              firestore.collection('AdminPanel').doc('technical').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  child: const Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Container(color: widget.mode? Colors.black:Colors.white, child: Center(child: Text('Ошибка загрузки данных', style: TextStyle(color: widget.mode? Colors.white:Colors.black,),)));
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return NoLibrary();
            } else {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              boolIsTechnicalWords = data['isTechnical'] ?? false;
            }
            return boolIsTechnicalWords == false
                ? widget.isConnected
                    ? Stack(
                      

                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: StreamBuilder<DocumentSnapshot>(
                                stream: firestore
                                    .collection('library')
                                    .doc('LibraryState')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                        child: const Center(
                                            child:
                                                CircularProgressIndicator()));
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text('Ошибка загрузки данных'));
                                  } else if (!snapshot.hasData ||
                                      !snapshot.data!.exists) {
                                    return NoLibrary();
                                  } else {
                                     Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

    List<String> newAuthors = List<String>.from(data['author'] ?? []);
    List<String> newGenres = List<String>.from(data['genre'] ?? []);
    List<String> newImages = List<String>.from(data['image'] ?? []);
    List<String> newNames = List<String>.from(data['name'] ?? []);
    List<String> newTexts = List<String>.from(data['text'] ?? []);
    List<String> newDescriptions = List<String>.from(data['description'] ?? []);
    

    // Добавляем новые значения из Firebase к спискам
    LibraryAuthor.addAll(newAuthors);
    LibraryGender.addAll(newGenres);
    LibraryImage.addAll(newImages);
    LibraryName.addAll(newNames);
    LibraryText.addAll(newTexts);
    LibraryDescription.addAll(newDescriptions);

    if (newAuthors.length != newGenres.length ||
        newGenres.length != newImages.length ||
        newImages.length != newNames.length ||
        newNames.length != newTexts.length ||
        newTexts.length != newDescriptions.length) {
    }
    int MinLength = newNames.length;

    if (MinLength > LibraryAuthor.length) MinLength = LibraryAuthor.length;
    if (MinLength > LibraryGender.length) MinLength = LibraryGender.length;
    if (MinLength > LibraryImage.length) MinLength = LibraryImage.length;
    if (MinLength > LibraryName.length) MinLength = LibraryName.length;
    if (MinLength > LibraryText.length) MinLength = LibraryText.length;
    if (MinLength > LibraryDescription.length) MinLength = LibraryDescription.length;

    // Функция для добавления новых элементов только если они уникальны
    void addUniqueItems(List<String> newList, List<String> existingList) {
      for (String newItem in newList) {
        if (!existingList.contains(newItem)) {
          existingList.add(newItem);
        }
      }
    }

    addUniqueItems(newAuthors, LibraryAuthor);
    addUniqueItems(newGenres, LibraryGender);
    addUniqueItems(newImages, LibraryImage);
    addUniqueItems(newNames, LibraryName);
    addUniqueItems(newTexts, LibraryText);
    addUniqueItems(newDescriptions, LibraryDescription);

    if (MinLength == 0) {
      return NoLibrary();
    }
                                    return Container(
                                      child: ListView(
                                        
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Textheader(text: "Библиотека", modes: widget.mode,),
                                          ),
                                          // search(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.grey[200],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AnimatedOpacity(
                                                    opacity:
                                                        isSearching ? 0.0 : 1.0,
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    child: IconButton(
                                                      onPressed: startSearching,
                                                      icon: const Icon(
                                                          Icons.search),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: AnimatedOpacity(
                                                      opacity:
                                                          isSearching ? 1.0 : 0.0,
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      child: IgnorePointer(
                                                        ignoring: !isSearching,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: TextField(
                                                            autofocus: true,
                                                            enabled: isSearching,
                                                            onSubmitted:
                                                                handleSearch,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  'Поиск по названию',
                                                              border: InputBorder
                                                                  .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  AnimatedOpacity(
                                                    opacity:
                                                        isSearching ? 1.0 : 0.0,
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    child: IconButton(
                                                      onPressed: stopSearching,
                                                      icon:
                                                          const Icon(Icons.close),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: widget.mode? Colors.black:Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 4,
                                                      offset: const Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                child: isSearching == false
                                                    ? Column(
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child:
                                                                AdditionalTitleText(
                                                                    text:
                                                                        "Новинки"),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 270,
                                                            child: ListView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              children: [
                                                                for (int i = 0;
                                                                    i < MinLength;
                                                                    i++)
                                                                  if (i <= 12)
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        handleUpDown(
                                                                            LibraryAuthor[(LibraryAuthor.length - 1) -
                                                                                i],
                                                                            LibraryDescription[(LibraryDescription.length - 1) -
                                                                                i],
                                                                            LibraryGender[(LibraryGender.length - 1) -
                                                                                i],
                                                                            LibraryImage[(LibraryImage.length - 1) -
                                                                                i],
                                                                            LibraryText[(LibraryText.length - 1) -
                                                                                i],
                                                                            LibraryName[(LibraryName.length - 1) -
                                                                                i]);
                                                                      },
                                                                      child: cards(
                                                                          name: LibraryName[
                                                                              (LibraryName.length - 1) -
                                                                                  i],
                                                                          author: LibraryAuthor[
                                                                              (LibraryAuthor.length - 1) -
                                                                                  i],
                                                                          genre: LibraryGender[
                                                                              (LibraryGender.length - 1) -
                                                                                  i],
                                                                          image_netvorsk:
                                                                              LibraryImage[(LibraryImage.length - 1) -
                                                                                  i]),
                                                                    )
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: AdditionalTitleText(
                                                                text:
                                                                    "Все книги"),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Center(
                                                            child: Wrap(
                                                              direction:
                                                                  Axis.horizontal,
                                                              spacing: 16.0,
                                                              children: [
                                                                for (int index =
                                                                        0;
                                                                    index <
                                                                        MinLength;
                                                                    index++)
                                                                  SizedBox(
                                                                    width: MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .width *
                                                                        0.4,
                                                                    height: 270,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () {
                                                                        handleUpDown(
                                                                            LibraryAuthor[(LibraryAuthor.length - 1) -
                                                                                index],
                                                                            LibraryDescription[(LibraryDescription.length - 1) -
                                                                                index],
                                                                            LibraryGender[(LibraryGender.length - 1) -
                                                                                index],
                                                                            LibraryImage[(LibraryImage.length - 1) -
                                                                                index],
                                                                            LibraryText[(LibraryText.length - 1) -
                                                                                index],
                                                                            LibraryName[(LibraryName.length - 1) -
                                                                                index]);
                                                                      },
                                                                      child: cards(
                                                                          name: LibraryName[(LibraryName.length -
                                                                                  1) -
                                                                              index],
                                                                          author: LibraryAuthor[(LibraryAuthor.length -
                                                                                  1) -
                                                                              index],
                                                                          genre: LibraryGender[(LibraryGender.length -
                                                                                  1) -
                                                                              index],
                                                                          image_netvorsk:
                                                                              LibraryImage[(LibraryImage.length - 1) -
                                                                                  index]),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Column(
                                                        children: filteredData
                                                                .isNotEmpty
                                                            ? List.generate(
                                                                filteredData
                                                                    .length,
                                                                (index) => Text(
                                                                    'items ${filteredData[index]}'))
                                                            : [NoLibrary()])
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          if (isShowDescription)
                            DescriptionBooks(
                              author: authors,
                              descriptions: descriptions,
                              genger: gengers,
                              image: images,
                              name: names,
                              text: texts,
                            ),
                        ],
                      )
                    : ErrorConnection()
                : ErrorServisTech();
          }),
    );
  }

  void init_isShowDescription() {
    setState(() {
      isShowDescription = !isShowDescription;
    });
  }
}
