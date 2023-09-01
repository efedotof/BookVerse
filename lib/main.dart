/// *****************************************
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



import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magazine/Auth/auth/login.dart';
import 'package:magazine/screens/home.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // SharedPreferences prefs = await SharedPreferences.getInstance();


  // String email = prefs.getString('email')??'';
  // String password = prefs.getString('passwords')??"";
  // bool islogin = false;

  // if(email != '' && password != ''){
  //   islogin = true;
  //   Auth().signinisstart(email, password);
  // }else{
  //   islogin = false;
  // }


  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(244, 255, 255, 255)),
      // initialRoute: islogin? '/Home':'/Registration',
      initialRoute: '/Home',
      routes: {
        '/Registration':(context) => const LoginScreen(),
        '/Home' :(context) => const Home()
      },
      debugShowCheckedModeBanner: false,
    )
  );











}







  



