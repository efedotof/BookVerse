import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:magazine/widgets/additional%20tools/block_more.dart';
import 'dart:io' show Platform;

import '../additional tools/cards_reade_todo.dart';
import '../additional tools/list_data_text.dart';
import '../until/AddFile.dart';


class List_views_2 extends StatefulWidget {
  const List_views_2({super.key});
  static _List_views_2State? of(BuildContext context) {
    return context.findAncestorStateOfType<_List_views_2State>();
  }

  @override
  State<List_views_2> createState() => _List_views_2State();
}

class _List_views_2State extends State<List_views_2> {
  bool ShowAddFiles = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Моя библиотека', style: TextStyle(color: Colors.black)),
                IconButton(onPressed: () {initShowAddFiles();}, icon: Icon(Icons.add, color: Colors.black)),
              ],
            ),
            automaticallyImplyLeading: false,
            expandedHeight: 40,
            toolbarHeight: 40,
            pinned: true,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: extraNameChild.length != 0
                    ? Container(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            if (extraNameChild.length != 0)
                              for (int i = 0; i < extraNameChild.length; i++)
                                i == 0
                                    ? cards_recs(
                                        name: extraNameChild[(extraNameChild.length - 1) - i],
                                        image: extraimgChild[(extraimgChild.length - 1) - i],
                                      )
                                    : i == 1
                                        ? cards_todo(
                                            name: extraNameChild[(extraNameChild.length - 1) - i],
                                            image: extraimgChild[(extraimgChild.length - 1) - i],
                                          )
                                        : cards_todo_list(
                                            name: extraNameChild[(extraNameChild.length - 1) - i],
                                            image: extraimgChild[(extraimgChild.length - 1) - i],
                                          )
                          ],
                        ),
                      )
                    : Container(
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
              block_more(),
              
              

            ]),
          ),
        ],
      ),
    );
  }

  void initShowAddFiles(){
    setState(() {
      ShowAddFiles = !ShowAddFiles;
    });
  }



}
