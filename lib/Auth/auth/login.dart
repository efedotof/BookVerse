/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-07-30                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************

import 'package:flutter/material.dart';
import 'package:magazine/Auth/auth/registration.dart';
import 'package:magazine/tools/message.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:magazine/widgets/until/AuthUntil/quicentry.dart';
import 'package:magazine/widgets/until/LottieWidget.dart';
import 'package:magazine/widgets/until/TextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  static _LoginScreenState? of(BuildContext context) {
    return context.findAncestorStateOfType<_LoginScreenState>();
  }
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final email = TextEditingController();
  final passwordController = TextEditingController();
  String textemail ='';
  String textpassword ='';
  bool quickentry = false;
  void signUserIn() {
    if (email.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Auth().signin(context, email.text, passwordController.text);
    } else {
      Message.show(context,
          message: 'Не все данные заполенены', duration: Duration(seconds: 3));
    }
  }
  @override
  void initState() {
    super.initState();
    inis();
    
  }
  Future inis() async{
    await getPrefs();
    if(textemail != '' && textpassword != ''){
      setState(() {
        quickentry = true;
      });
    }else{
      clear_prefs();
    }
  }

  void quickentryState(){
    setState(() {
      quickentry = !quickentry;
    });
  }

  Future clear_prefs()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
    print('Данные успешно удалены');
  }



  Future setPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email.text);
    prefs.setString('passwords', passwordController.text);
  }
  Future getPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      textemail = prefs.getString('email')??'';
      textpassword = prefs.getString('passwords')?? '';
    });
  }



  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Lotties(
                    image: 'assets/login.json',
                    width: 200,
                    heigth: 200,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Добро пожаловать, авторизируйтесь',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: email,
                    hintText: 'Логин',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Пароль',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {}, child: Text('Забыли пароль?'))
                      ],
                    ),
                  ),
        
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              if(textemail != email.text && textpassword != passwordController.text){
                                clear_prefs();
                              }
                              setPrefs();
                              signUserIn();

                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            child: const Text(
                              'Войти',
                              style: TextStyle(
                                color: Colors.white, // Белый цвет текста
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
        
                  const SizedBox(height: 30),
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Нет аккаунта ?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Registration()),
                            );
                          },
                          child: const Text(
                            'Зарегистрироваться',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
           IgnorePointer(
              ignoring: !quickentry, // Make it non-clickable when quickentry is false
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: quickentry ? 1.0 : 0.0,
                child: QuicEntry(email: textemail, password: textpassword),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
