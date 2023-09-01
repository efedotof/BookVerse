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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:magazine/Auth/auth/login.dart';
import 'package:magazine/tools/message.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:magazine/widgets/until/LottieWidget.dart';
import 'package:magazine/widgets/until/TextField.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final usernameController = TextEditingController();
  final nickname = TextEditingController();
  final email = TextEditingController();
  final passwordController = TextEditingController();
  final repeatpasswordController = TextEditingController();

  void usingin() {
    if (usernameController.text.isNotEmpty &&
        nickname.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        repeatpasswordController.text.isNotEmpty &&
        email.text.isNotEmpty) {
      if (passwordController.text.length < 10 ||
          containsForbiddenCharacters(passwordController.text)) {
        Message.show(context,
            message:
                "Пароль должен содержать не менее 10 символов и не содержать запрещенные символы",
            duration: const Duration(seconds: 3));
      } else if (passwordController.text != repeatpasswordController.text) {
        Message.show(context,
            message: "Пароли не совпадают",
            duration: const Duration(seconds: 3));
      } else if (!isValidEmail(email.text)) {
        Message.show(context,
            message: "Неправильный формат почты",
            duration: const Duration(seconds: 3));
      } else {
        Auth().registration(context, email.text, passwordController.text,
        

            usernameController.text, nickname.text);
      }
    } else {
      Message.show(context,
          message: "Не все данные заполнены",
          duration: const Duration(seconds: 3));
    }
  }

  bool containsForbiddenCharacters(String text) {
    final forbiddenCharacters = RegExp(r'[!@#\$%^&*()\[\]{}<>?":;]');
    return forbiddenCharacters.hasMatch(text);
  }

  bool isValidEmail(String email) {
    // Проверка на правильный формат электронной почты с использованием регулярного выражения.
    final emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  Future setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email.text);
    prefs.setString('passwords', passwordController.text);
  }


  Future clear_prefs()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print('Данные успешно удалены');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Lotties(
                  image: 'assets/registration.json',
                  width: 150,
                  heigth: 150,
                ),
                const SizedBox(height: 25),
                Text(
                  'Добро пожаловать, сначала зарегистрируйтесь',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Имя и фамилия пользователя',
                  obscureText: false,
                ),
                MyTextField(
                  controller: nickname,
                  hintText: 'Никнейм',
                  obscureText: false,
                ),
                MyTextField(
                  controller: email,
                  hintText: 'Почта',
                  obscureText: false,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Пароль',
                  obscureText: true,
                ),
                MyTextField(
                  controller: repeatpasswordController,
                  hintText: 'Повторите пароль',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
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
                            clear_prefs();
                            setPrefs();

                            usingin();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: const Text(
                            'Зарегистрироваться',
                            style: TextStyle(
                              color: Colors.white, // Белый цвет текста
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Есть аккаунт ?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Войти',
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
      ),
    );
  }
}
