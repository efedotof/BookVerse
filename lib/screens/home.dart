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
import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:magazine/widgets/until/AuthUntil/UserModel.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_page/list_page3.dart';
import 'list_page/list_page_1.dart';
import 'list_page/list_page_2.dart';

class Home extends StatefulWidget {
  const Home({super.key,
  });
  static _HomeState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HomeState>();
  }
  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  int selectedPageIndex = 0;
  int cIndex = 0;
  bool isConnecteds = true;
  bool isTechnicals = false; 
  String svg = '';
  bool isLoading = true;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  String name = '';
  String email = '';
  String nickname ='';
  User? user = FirebaseAuth.instance.currentUser;
  UserModel model = UserModel();
  bool modes = false;



  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    setState(() {
      
    });
  }

  
  void ColorsMode(){
    setState(() {
      modes = !modes;
    });
  }





  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  setState(() {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      isConnecteds = false; // нет подключения
    } else {
      isConnecteds = true;
      if (user != null) {
        try {
          FirebaseFirestore.instance.collection('users').doc(user!.uid).get().then((value) {
            if (value.exists) {
              this.model = UserModel.fromMap(value.data()!);
              if (model.email != null && model.name != null && model.nickname != null) {
                setState(() {
                  isLoading = false;
                  print(model.email);
                });
              }
            } else {
              // Handle the case where the document doesn't exist
            }
          });
        } catch (e) {
          // Handle the error
        }
      } else {
        // Handle the case where user is null
      }
    }
  });
}




  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor:modes? Colors.black : Colors.white,
        body: 
        // isLoading? Center(child: CircularProgressIndicator(),) :
        
        Center(child:  
        IndexedStack(
          index: selectedPageIndex,
          children:  [
            List_views_2(isConnected: isConnecteds, isTechnical: isTechnicals, mode: modes,),
            List_views(isConnected: isConnecteds, isTechnical: isTechnicals, mode: modes,),
            search_page(email: model.email,name:model.name ,nickname: model.nickname,uid:model.uid, isConnected: isConnecteds, mode: modes,),
          ],
        ),
        
        ),
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: selectedPageIndex,
            onTap: (i) => setState(() => selectedPageIndex = i),
            items: [
              SalomonBottomBarItem(
                icon:  Icon(Icons.home,color:  modes ?Colors.white: Colors.black),
                title:  Text("Моя библиотека", style: TextStyle(color: modes ?Colors.white: Colors.black),),
                selectedColor: Colors.purple,
              ),
              // SalomonBottomBarItem(
              //   icon:  Icon(Icons.library_books,color:  modes ?Colors.white: Colors.black),
              //   title:  Text("Библиотека", style: TextStyle(color: modes ?Colors.white: Colors.black),),
              //   selectedColor: Colors.purple,
              // ),
              // SalomonBottomBarItem(
              //   icon:  Icon(Icons.person, color:  modes ?Colors.white: Colors.black),
              //   title:  Text("Профиль", style: TextStyle(color: modes ?Colors.white: Colors.black),),
              //   selectedColor: Colors.purple,
              // ),
            ],
        ),
    );
  }
}

