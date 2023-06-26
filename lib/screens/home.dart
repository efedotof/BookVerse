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
              sweetActive: const Icon(Icons.home),
              sweetIcon: const Icon(
                Icons.home_outlined,
              ),
              sweetLabel: 'Home',

              sweetBackground: Colors.red),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.business), sweetLabel: 'Business'),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.school), sweetLabel: 'School'),
        ],
        onTap: (index) {
          setState(() {
            cIndex = index;
          });
        },
      ),

      // bottomNavigationBar: SweetNavBar(

      //   currentIndex: cIndex,
      //   paddingBackgroundColor: Colors.red,
      //   items: [
      //     SweetNavBarItem(
      //         sweetActive: const Icon(Icons.home),
      //         sweetIcon: const Icon(
      //           Icons.home_outlined,
      //         ),
      //         sweetLabel: 'Home',
             
      //         sweetBackground: Colors.red),
      //     SweetNavBarItem(
      //         sweetIcon: const Icon(Icons.business), sweetLabel: 'Business'),
      //     SweetNavBarItem(
      //         sweetIcon: const Icon(Icons.school), sweetLabel: 'School'),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       cIndex = index;
      //     });
      //   },
      // ),
        // body:  [
        //   List_views(context),
        //   List_views_2(context),
        //   search_page(context),
        // ][selectedPageIndex],
        // bottomNavigationBar: NavigationBar(
        // selectedIndex: selectedPageIndex,
        //   onDestinationSelected: (int index) {
        //     setState(() {
        //       selectedPageIndex = index;
        //     });
        //   },
        //   destinations: const <NavigationDestination>[
        //     NavigationDestination(
        //       selectedIcon: Icon(Icons.person),
        //       icon: Icon(Icons.book),
        //       label: 'Learn',
        //     ),
        //     NavigationDestination(
        //       selectedIcon: Icon(Icons.engineering),
        //       icon: Icon(Icons.read_more),
        //       label: 'Relearn',
        //     ),
        //     NavigationDestination(
        //       selectedIcon: Icon(Icons.bookmark),
        //       icon: Icon(Icons.bookmark_border),
        //       label: 'Unlearn',
        //     ),
        //   ],
        // ),
      );
  }
}

