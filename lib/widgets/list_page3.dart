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
  late Alignment _aligments;
  double size_h = MediaQuery.of(context).size.width;
  int elements_list = 10;
  _aligments =  Alignment.topCenter;
   final _controller = TextEditingController();
  String text_hint = 'Книги';

  void text_edits(){
    debugPrint("${_controller.text}");

  }
  



  return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          // title: const Text('Поиск', style: TextStyle(color: Colors.black),),
          title:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(alignment: _aligments,child: const Text('Поиск', style: TextStyle(color: Colors.black),)),
                ),
                Center(
                child: Container(
                  width: size_h,
                  child: SearchField(
                    controller: _controller,
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
                    hint: text_hint,
                    itemHeight: 50,
                    // suggestionsDecoration: SuggestionDecoration(
                    //     padding: const EdgeInsets.all(4),
                    //     border: Border.all(color: Colors.black),
                    //     borderRadius: BorderRadius.all(Radius.circular(30))),
                    // suggestions: suggestions
                    //     .map((e) => SearchFieldListItem<String>(e,
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 4.0),
                    //           child: Text(e,
                    //               style: TextStyle(fontSize: 24, color: Colors.black)),
                    //         )))
                    //     .toList(),
                    // focusNode: focus,
                    // suggestionState: Suggestion.expand,
                    // onSuggestionTap: (SearchFieldListItem<String> x) {
                    //   focus.unfocus();
                    // },
                  ),
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
        ),
      ],
      // The content of the scroll view
      body: ListView.builder(
        itemCount:elements_list,
        itemBuilder: (context, index) => ListTile(
          title: Padding(
                padding: const EdgeInsets.all(8.0),
                child:ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white,elevation: 1),
                onPressed: () {
                  _controller.text = 'Text ${index}';
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Text ${index}', style: TextStyle(color: Colors.black),), // <-- Text
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon( // <-- Icon
                      Icons.search,
                      size: 24.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      
    );
}