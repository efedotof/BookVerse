
/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-08-05                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magazine/Auth/auth/login.dart';
import 'package:magazine/tools/message.dart';

import 'Auth.dart';

class QuicEntry extends StatefulWidget {
  const QuicEntry({super.key, required this.email, required this.password});
  final String email;
  final String password;

  @override
  State<QuicEntry> createState() => _QuicEntryState();
}

class _QuicEntryState extends State<QuicEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black54,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
         // затемнение экрана
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: GestureDetector(
            onTap: () {
              LoginScreen.of(context)!.quickentryState();
            },
          )),
          
          Container(
              width: MediaQuery.of(context).size.width,
               decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10,),
                  const Text(
                    'Быстрый вход',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'YourFontFamily',
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('Почта:'),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Пароль:'),
                        ],
                      ),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          Text(
                            '${widget.email}',
                            style: const TextStyle(
                              // Добавьте другие свойства стиля, если необходимо
                              decoration:
                                  TextDecoration.none, // Убирает подчеркивание
                              fontFamily:
                                  'YourFontFamily', // Укажите нужный шрифт, если требуется
                              fontSize: 16, // Размер шрифта
                              color: Colors.black, // Цвет текста
                              letterSpacing: 2.0, // Межбуквенное расстояние
                              // Используйте TextPainter для замены символов на "*"
                              // Заменяем символы на "*"
                              // Если вы хотите заменить каждый символ на "*", раскомментируйте следующую строку
                              // child.text = String.fromCharCodes(List.filled(child.text.runes.length, 42));
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '*' * widget.password.length,
                            style: const TextStyle(
                              // Добавьте другие свойства стиля, если необходимо
                              decoration:
                                  TextDecoration.none, // Убирает подчеркивание
                              fontFamily:
                                  'YourFontFamily', // Укажите нужный шрифт, если требуется
                              fontSize: 16, // Размер шрифта
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade500,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        if (widget.email != '' && widget.password != '') {
      Auth().signin(context, widget.email, widget.password);
    } else {
      Message.show(context,
          message: 'Неправильный логин или пароль', duration: Duration(seconds: 3));
    }


                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(
                        'Продолжить',
                        style: TextStyle(
                          color: Colors.white, // Белый цвет текста
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Container(
                  //   width: 120,
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue.shade500,
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: OutlinedButton(
                  //     onPressed: () {},
                  //     style: OutlinedButton.styleFrom(
                  //       side: BorderSide.none,
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(30)),
                  //     ),
                  //     child: const Text(
                  //       'Отмена',
                  //       style: TextStyle(
                  //         color: Colors.white, // Белый цвет текста
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )),
        ]));
  }
}