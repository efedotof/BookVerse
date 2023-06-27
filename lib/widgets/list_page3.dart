import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:searchfield/searchfield.dart';

Widget search_page(BuildContext context){
  int suggestionsCount = 12;
  final focus = FocusNode();
  final suggestions =
        List.generate(suggestionsCount, (index) => 'suggestion $index');
  late ScrollController _scrollController;
  // late Alignment _aligments;
  // _aligments =  Alignment.centerLeft;
  // void sc(){
  //   _scrollController = ScrollController()
  //   ..addListener(() {
  //       _aligments =  Alignment.topCenter;
  //        if (_scrollController.position.pixels == 30.0){
  //           _aligments =  Alignment.centerLeft;
  //        }
  //   });
  // }


  // sc();
  return NestedScrollView(
        floatHeaderSlivers: true,
        // controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          // title: const Text('Поиск', style: TextStyle(color: Colors.black),),
          title:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(alignment: Alignment.centerLeft,child: const Text('Читаю сейчас', style: TextStyle(color: Colors.black),)),
                ),
                Center(
                child: SearchField(
                  onSearchTextChanged: (query) {
                    final filter = suggestions
                        .where((element) =>
                            element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) => SearchFieldListItem<String>(e,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(e,
                                  style: TextStyle(fontSize: 24, color: Colors.black)),
                            )))
                        .toList();
                  },
                  key: const Key('searchfield'),
                  hint: 'Книги',
                  itemHeight: 50,
                  suggestionsDecoration: SuggestionDecoration(
                      padding: const EdgeInsets.all(4),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  suggestions: suggestions
                      .map((e) => SearchFieldListItem<String>(e,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(e,
                                style: TextStyle(fontSize: 24, color: Colors.black)),
                          )))
                      .toList(),
                  focusNode: focus,
                  suggestionState: Suggestion.expand,
                  onSuggestionTap: (SearchFieldListItem<String> x) {
                    focus.unfocus();
                  },
                ),
                ),
              ],
            ),
          
          expandedHeight: 80,
          toolbarHeight:100,
          elevation: 0,
          pinned: true,
          floating: true,
          backgroundColor: Colors.white,
          forceElevated: innerBoxIsScrolled,
          actions: [
            
          ],
          
        ),
      ],
      // The content of the scroll view
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'Text $index',
          ),
        ),
      ),
    );
}