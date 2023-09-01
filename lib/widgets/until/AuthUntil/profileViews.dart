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




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magazine/widgets/additional%20tools/cardsing.dart';
import 'package:magazine/list_data_text.dart';
import 'UserModel.dart';
import 'additionalСontinuationWidget.dart';


class ProfileScreensView extends StatefulWidget {
  const ProfileScreensView({super.key,
    required this.uid,
  }); 
   final String? uid;
  @override
  State<ProfileScreensView> createState() => _ProfileScreensViewState();
}

class _ProfileScreensViewState extends State<ProfileScreensView> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel model = UserModel();
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('users').doc(widget.uid!)
    .get().then((value){
      this.model = UserModel.fromMap(value.data());
      setState(() {
        if(model.email!= null && model.name != null && model.nickname != null){
          _isloading = false;
        }
      });
    });
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ 
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height:30,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Мой профиль'),
                      Center(
                        child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center( // Обертка для иконки, чтобы разместить ее посередине
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu,size: 16,),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ),
                
                    ],
                  ),
                ),
              ),
              const SizedBox(height:10,),
              Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blueAccent.shade100,
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    // left
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Material(
                                // Wrap the avatar with Material widget for highlighting effect
                                color: Colors.transparent,
                                child: Material(
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue.shade100,
                                    radius: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: StreamBuilder(
                                      stream: FirebaseFirestore.instance.collection('users').doc(widget.uid).collection('images').snapshots(),
                                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                              if(snapshot.connectionState == ConnectionState.waiting){
                                                          return Center(child: CircularProgressIndicator());
                                              } 
                                              else {
                                                if (snapshot
                                                    .data!.docs.isEmpty) {
                                                  return const Center(
                                                    child:
                                                        Text(' '),
                                                  );
                                                }
                                                return ClipOval(
                                                    child: Image.network(
                                                  snapshot.data!.docs[snapshot
                                                          .data!.docs.length -
                                                      1]['URL'],
                                                  height: 140,
                                                  width: 140,
                                                  fit: BoxFit.cover,
                                                ));
                                              }
                                      } ,
                                    ),

                                  ),
                                ),
                              ),
                      ],),
                
                    ),  
                    //rigth
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _isloading? CircularProgressIndicator(): Text(model.name.toString()),
                          const SizedBox(height: 10,),
                          _isloading? CircularProgressIndicator():Text(model.nickname.toString()),
                          const SizedBox(height: 10,),
                          _isloading? CircularProgressIndicator():Text(model.email.toString()),
                        ],
                      ),
                    ), 
                  ],),
                ),
              ),
              const SizedBox(height:20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Align(alignment: Alignment.topLeft,child: const Text('Мои публикации')),
              ),
              Wrap(
          direction: Axis.horizontal, 
          spacing: 16.0, 
          children: [
            for (int index = 0; index < 10; index++)
              SizedBox(
          width: MediaQuery.of(context).size.width *0.4, 
          height: MediaQuery.of(context).size.height * 0.4 - 10,
        
          child:  const cards(name: 'Название', author: 'Автор', genre: 'Жанр', image_netvorsk: 'assets/testImage.jpg'),
              ),
          ],
                )
                
            ],
          ),
        ),
        const  AdditionalContinuationWidget(),



        ],
      ),
    );
  }
}