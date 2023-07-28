import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../widgets/list_page/list_page3.dart';
import '../widgets/list_page/list_page_1.dart';
import '../widgets/list_page/list_page_2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  int selectedPageIndex = 0;
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child:  
        // [List_views(context),List_views_2(context),search_page(context),][cIndex]
        IndexedStack(
          index: selectedPageIndex,
          children: [
            List_views_2(),
            List_views(),
            
            search_page(),
          ],
        ),
        
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: selectedPageIndex,
          onTap: (i) => setState(() => selectedPageIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.purple,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.settings),
              title: Text("Search"),
              selectedColor: Colors.purple,
            ),

          ],
      ),
      );
  }
}

