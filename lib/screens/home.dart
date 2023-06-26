import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../widgets/cardsing.dart';
import '../widgets/list_page3.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import '../widgets/list_page_1.dart';
import '../widgets/list_page_2.dart';

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
        child: Center(child:  [List_views(context),List_views_2(context),search_page(context),][cIndex]),
      ),
      bottomNavigationBar: SweetNavBar(
        
        height: 40,
        boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 3))],
        currentIndex: cIndex,
        paddingBackgroundColor:  Colors.white.withOpacity(0),
        items: [
          SweetNavBarItem(
              sweetActive: const Icon(Icons.book_sharp),
              sweetIcon: const Icon(
                Icons.book_sharp,
              ),
              sweetLabel: 'Home',

              sweetBackground: Colors.red),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.chrome_reader_mode), sweetLabel: 'Business'),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.search), sweetLabel: 'School'),
        ],
        onTap: (index) {
          setState(() {
            cIndex = index;
          });
        },
      ),

      
      );
  }
}

