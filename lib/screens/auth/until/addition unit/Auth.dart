/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-08-04                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************


import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:magazine/screens/auth/until/avatar.dart';
import 'package:magazine/screens/auth/until/profileViews.dart';
import 'package:magazine/screens/home.dart';
import 'UserModel.dart';

class Auth{
  final _auth = FirebaseAuth.instance;
  void registration(context, String email, String password, String name, String nickname)async{
    postDetails() async{
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();
      userModel.email = user!.email;
      userModel.uid = user!.uid;
      userModel.name = name;
      userModel.nickname = nickname;

      await firebaseFirestore.collection('users').doc(user.uid).set(userModel.toMap());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AvatarCreat()), (route) => false);
    }
    
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) => {
      postDetails()
    }).catchError((e){
      print('create error ${e}');
    });

    
 
  }
   void signin(context, String email, String password)async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) =>{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Home()), (route) => false)
    } ).catchError((e){
      print('sigin ${e}');
    });
  }

  Future uploadImage(context, File? file) async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    final PostID = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child('${user!.uid}/images').child('post_$PostID');
    await ref.putFile(file!);
    String? downloadURL = await ref.getDownloadURL();
    print("downloadURL $downloadURL");

    await firebaseFirestore.collection('users').doc(user!.uid)
    .collection('images').add({'URL': downloadURL}).whenComplete(() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  ProfileScreensView(uid: user!.uid,)), (route) => false));



  }

  Future noImages(context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> ProfileScreensView(uid: user!.uid)), (route) => false);
  }


}