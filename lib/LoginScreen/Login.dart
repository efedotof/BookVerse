import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/Button/ButtonRegistration.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/HeadingText.dart';
import 'package:readerabooks/HomeScreen/Home.dart';

import '../Definingpage/AdditionScreens/LabelText.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,leading: IconButton(
    icon: Icon(Icons.chevron_left), // Замените "new_icon" на иконку, которую вы хотите использовать
    onPressed: () {
      Navigator.pop(context);
    },
  ),),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: [
              Container(
                child: Column(
                  children: [
                     Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Lottie.asset(
                    'assets/lottie/loaded.json',
                    fit: BoxFit.fill,
                  ),
                ),
                    SizedBox(height: 20,),
                    HeadingText(text: "Login"),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                          child: LabelText(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width / 1.12,
                child: Column(
                  children: [
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()), //Почта
                    SizedBox(height: 10,),
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()), //Пароль
                    SizedBox(height: 20,),
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: ButtonRegistration(text: 'Continue', onPressed: (){
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );


                      }),),
                      SizedBox(height: 10,)
                  ],
                ),
              ),        
            ],
          ),
        ),
      ),
    );
  }
}



/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/