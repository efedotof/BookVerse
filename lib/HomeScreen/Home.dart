import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readerabooks/HomeScreen/AdditionScreens/Bag.dart';
import 'package:readerabooks/HomeScreen/AdditionScreens/Booksstore.dart';
import 'package:readerabooks/HomeScreen/AdditionScreens/Bookshelf.dart';
import 'package:readerabooks/HomeScreen/AdditionScreens/Communication.dart';
import 'package:readerabooks/HomeScreen/AdditionScreens/Menu/Settings/Setting.dart';
import 'package:readerabooks/HomeScreen/AdditionScreens/Scanner/ScannerQr.dart';
import 'package:readerabooks/HomeScreen/AdditionScreens/notification.dart';
import 'package:readerabooks/HomeScreen/WidgetsToSTF/Search.dart';
import 'package:readerabooks/ThemeMyApp/CustomTheme.dart';
import 'package:readerabooks/ThemeMyApp/config.dart';
import 'package:readerabooks/ThemeMyApp/localization.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  
 


  final List<Widget> _screens = [
    BookShelf(),
    BookShare(),
    Bag(),
    Communication(),
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              Scaffold.of(context).openDrawer(); 
            },
          ),
        ),
        actions: [
          Search(),
          IconButton(
            onPressed: () {

                
 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScannerQr()),
            );

            },
            icon: Icon(Icons.flip),
          ),
          IconButton(
            onPressed: () {

                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreens()),
            );




            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
     
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
      
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            label: appLocalizations.translate('MenuItemsOneOnHome'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: appLocalizations.translate('MenuItemsTwoOnHome'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: appLocalizations.translate('MenuItemsThreeOnHome'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_comment),
            label: appLocalizations.translate('MenuItemsFourOnHome'),
            
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
      
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            ListTile(
              title: Container(height: MediaQuery.of(context).size.height * 0.02,width: MediaQuery.of(context).size.width * 0.02 ),
              onTap: () {
              },
            ),
            ListTile(
              title:Container(child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name Author', style: Theme.of(context).primaryTextTheme.bodyText1,),
                    Text('email users', style: Theme.of(context).primaryTextTheme.bodyText2)
                  ],
                )


              ],),),
              onTap: () {
                Navigator.pop(context); 
              },
            ),


            ListTile(
              leading: Icon(Icons.home, color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),
              title: Text(appLocalizations.translate('DrawerOnHomeToHomeScreens')!, style: TextStyle(color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),),
              onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
              },
            ),
             ListTile(
              leading: Icon(Icons.collections, color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),
              title: Text(appLocalizations.translate('DrawerOnNewCollectionsToHomeScreens')!, style: TextStyle(color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),),
              onTap: () {
               
              },
            ),
             ListTile(
              leading: Icon(Icons.edit_road,  color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),
              title: Text(appLocalizations.translate('DrawerOnEditorsToHomeScreens')!, style: TextStyle(color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),),
              onTap: () {
               
              },
            ),
             ListTile(
              leading: Icon(Icons.topic, color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),
              title: Text(appLocalizations.translate('DrawerOnTopDealseToHomeScreens')!, style: TextStyle(color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),),
              onTap: () {
               
              },
            ),
             ListTile(
              leading: Icon(Icons.notifications, color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),
              title: Text(appLocalizations.translate('DrawerOnNotificationsToHomeScreens')!, style: TextStyle(color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),),
              onTap: () {
               
              },
            ),
             ListTile(
              leading: Icon(Icons.settings, color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),
              title: Text(appLocalizations.translate('DrawerOnSettingToHomeScreens')!, style: TextStyle(color: currentTheme.currentTheme == CustomTheme.darkTheme?Color(0xFF6F6F6F):Color(0xFF6F6F6F)),),
              onTap: () {
                
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingMenuPages()),
            );
              },
            ),
            
 
          ],
        ),
      ),
    );
  }
}