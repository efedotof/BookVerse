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
import 'package:magazine/list_data_text.dart';
import 'package:magazine/Auth/auth/login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:magazine/screens/home.dart';
import 'package:magazine/tools/message.dart';
import 'package:magazine/widgets/until/AuthUntil/profileViews.dart';
import 'UserModel.dart';
import 'avatar.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  void registration(BuildContext context, String email, String password,
      String name, String nickname) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white, // Цвет фона
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10.0), // Задаем радиус углов для создания маленького окна
            ),
            content: Container(
              width: 100,
              height: 100,
              child: SpinKitCircle(
                color: Colors.blue, // Цвет спиннера
                size: 40.0, // Размер спиннера
              ),
            ),
          );
        },
      );

      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = _auth.currentUser;
        UserModel userModel = UserModel();
        userModel.email = user!.email;
        userModel.uid = user!.uid;
        userModel.name = name;
        userModel.nickname = nickname;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());

        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AvatarCreat()),
          (route) => false,
        );
      }).catchError((e) {
        print('create error ${e}');
        Navigator.pop(
            context); // Закрыть диалоговое окно с индикатором загрузки
      });
    } catch (e) {
      print('create error $e');
      Navigator.pop(context); // Закрыть диалоговое окно с индикатором загрузки
    }
  }

  void signin(BuildContext context, String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white, // Цвет фона
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              width: 100,
              height: 100,
              child: SpinKitCircle(
                color: Colors.blue,
                size: 40.0,
              ),
            ),
          );
        },
      );

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false,
      );
    } catch (e) {
      String errorMessage = "Произошла ошибка входа.";

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = "Пользователь с таким email не найден.";

            break;
          case 'wrong-password':
            errorMessage = "Неверный пароль.";
            break;
          case 'invalid-email':
            errorMessage = "Некорректный email.";
            break;
          default:
            errorMessage = "Произошла ошибка входа. Попробуйте еще раз.";
        }
      }
      Message.show(context,
          message: errorMessage, duration: Duration(seconds: 3));
      print('signin error: $errorMessage');
    }
  }

  Future uploadImage(context, File? file) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white, // Цвет фона
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10.0), // Задаем радиус углов для создания маленького окна
            ),
            content: Container(
              width: 100,
              height: 100,
              child: const SpinKitCircle(
                color: Colors.blue, // Цвет спиннера
                size: 40.0, // Размер спиннера
              ),
            ),
          );
        },
      );
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      if (user == null) {
        throw Exception("User is not authenticated");
      }

      final PostID = DateTime.now().microsecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('${user.uid}/images')
          .child('post_$PostID');

      UploadTask uploadTask = ref.putFile(file!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      if (taskSnapshot.state == TaskState.error) {
        throw Exception("Error uploading image");
      }

      String? downloadURL = await ref.getDownloadURL();

      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .collection('images')
          .add({'URL': downloadURL});

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreensView(uid: user.uid)),
        (route) => false,
      );
    } catch (error) {}
  }



  
  Future noImages(context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              width: 100,
              height: 100,
              child: SpinKitCircle(
                color: Colors.blue, // Цвет спиннера
                size: 40.0, // Размер спиннера
              ),
            ),
          );
        },
      );
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      if (user == null) {
        throw Exception("User is not authenticated");
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreensView(uid: user.uid)),
        (route) => false,
      );
    } catch (error) {}
  }

  Future<void> addStatusData(
    String name,
    String datas,
    String status,
    String? uid,
    String author,
    String description,
    String genger,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference adminPanelCollection =
          FirebaseFirestore.instance.collection('AdminPanel');
      DocumentSnapshot docSnapshot =
          await firestore.collection('AdminPanel').doc(uid).get();

      if (!docSnapshot.exists) {
        await firestore.collection('adminPanelCollection').doc(uid).set({
          'uid': uid,
        });
      }

      if (docSnapshot.exists) {
        Map<String, dynamic> data =
            await docSnapshot.data() as Map<String, dynamic>;

        currentDataKIK = await List<String>.from(data['data'] ?? []);
        currentStatusKIK = await List<String>.from(data['status'] ?? []);

        currentNamesKIK = await List<String>.from(data['name'] ?? []);
        currentTextKIK = await List<String>.from(data['text'] ?? []);
        currentImageKIK = await List<String>.from(data['image'] ?? []);
        currentAuthor = await List<String>.from(data['author'] ?? []);
        currentGenger = await List<String>.from(data['genger'] ?? []);
        currentDescriptions =
            await List<String>.from(data['description'] ?? []);
      }
      currentDataKIK.add(datas);
      currentNamesKIK.add(name);
      currentStatusKIK.add(status);
      currentTextKIK.add('');
      currentImageKIK.add('');
      currentAuthor.add(author);
      currentGenger.add(genger);
      currentDescriptions.add(description);
      await firestore.collection('AdminPanel').doc(uid).set({
        'name': currentNamesKIK,
        'data': currentDataKIK,
        'status': currentStatusKIK,
        'description': currentDescriptions,
        'text': currentTextKIK,
        'image': currentImageKIK,
        'author': currentAuthor,
        'genger': currentGenger,
      });
    } catch (e) {}
  }

  String? getUIDManager() {
  User? user = _auth.currentUser;
  if (user != null) {
    return user.uid;
  } else {
    // Handle case where user is not authenticated
    return null;
  }
}

  Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

void signinisstart(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      

      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      String errorMessage = "Произошла ошибка входа.";

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = "Пользователь с таким email не найден.";

            break;
          case 'wrong-password':
            errorMessage = "Неверный пароль.";
            break;
          case 'invalid-email':
            errorMessage = "Некорректный email.";
            break;
          default:
            errorMessage = "Произошла ошибка входа. Попробуйте еще раз.";
        }
      }
      print('signin error: $errorMessage');
    }
  }


}
