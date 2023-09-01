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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:magazine/widgets/until/error/noConnection.dart';
import 'package:magazine/widgets/until/error/noLibraryList.dart';

// ignore: camel_case_types
class block_more extends StatefulWidget {
  const block_more(
      {super.key, required this.isConnected, required this.isTechnical});
  final bool isConnected;
  final bool isTechnical;

  @override
  State<block_more> createState() => _block_moreState();
}

// ignore: camel_case_types
class _block_moreState extends State<block_more> {

  Color statusColors( String text ){
    try{
      if( text == 'На рассмотрении'){
      return Colors.orange;
    }else if(text == 'Подготовка'){
      return Colors.lightGreen ;
    }else if(text == 'Опубликовано'){
        return Colors.green;
    }else if(text == 'Не опубликовано'){
      return Colors.red;
    }else{
      return Colors.black;
    }

    }catch(e){
      debugPrint('$e');
      return Colors.black;
    }
    
  }
  String textNameStatus(String text){
    try{
      if(text.length > 15){
        text = text.substring(0, 15).toLowerCase() + '...';
        return text;
      }else{
        return text;
      }
    }catch(e){
      debugPrint("error textNameStatus $e");
      return '';
    }
  }



  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> currentNamesKIK = [];
  List<String> currentDataKIK = [];
  List<String> currentStatusKIK = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(227, 234, 229, 229),
              ),
              height: 300,
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<DocumentSnapshot>(
                  stream: firestore
                      .collection('AdminPanel')
                      .doc(Auth().getUIDManager())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Container(
                              color: Colors.transparent,
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator()));
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text('Error fetching data');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      // Check for null data
                      return ErrorConnection();
                    } else {
                      Map<String, dynamic>? data = snapshot.data!.data()
                          as Map<String, dynamic>?; // Use nullable type
                      if (data == null) {
                        return NoLibrary();
                      }
                      currentNamesKIK = List<String>.from(data['name'] ?? []);
                      currentDataKIK = List<String>.from(data['data'] ?? []);
                      currentStatusKIK =
                          List<String>.from(data['status'] ?? []);

                      int minLength = currentNamesKIK.length;
                                    if (currentDataKIK.length < minLength) minLength = currentDataKIK.length;
                                    if (currentStatusKIK.length < minLength) minLength = currentStatusKIK.length;
                                    if(minLength == 0){
                                      return NoLibrary();
                                    }
                      return Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Статус'),
                          ),
                          const SizedBox(height: 26,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: List.generate(
                                  minLength,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(textNameStatus(currentNamesKIK[(currentDataKIK.length - 1) - index])),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 23,
                              ),
                              Column(
                                children: List.generate(
                                  minLength,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(currentDataKIK[ (currentDataKIK.length - 1) - index]),
                                  ),
                                  
                                ),
                                
                              ),
                              const SizedBox(
                                width: 23,
                              ),
                              Column(
                                children: List.generate(
                                  minLength,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(currentStatusKIK[(currentStatusKIK.length - 1) - index], style: TextStyle(color: statusColors(currentStatusKIK[(currentStatusKIK.length - 1) - index])),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  })),
        ),
      ),
      );
  }
}


/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/