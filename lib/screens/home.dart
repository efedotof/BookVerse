import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../widgets/cardsing.dart';
import '../widgets/list_viewss.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  [
          List_views(context),
          Center(
            child: Text(
              'Relearn 👨‍🏫',
            ),
          ),
          Center(
            child: Text(
              'Unlearn 🐛',
            ),
          ),
        ][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.book),
              label: 'Learn',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.engineering),
              icon: Icon(Icons.read_more),
              label: 'Relearn',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Unlearn',
            ),
          ],
        ),
      );
  }
}

