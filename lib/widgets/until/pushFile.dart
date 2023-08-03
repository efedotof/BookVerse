// ignore_for_file: file_names
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
import 'package:flutter/material.dart';

import '../list_page/list_page_2.dart';

class PushFile extends StatefulWidget {
  const PushFile({super.key});

  @override
  State<PushFile> createState() => _PushFileState();
}

class _PushFileState extends State<PushFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.black45,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, 
      child: Column(
        children: [
          Expanded(child: GestureDetector(onTap: () {
           List_views_2.of(context)!.initPushMyBook();
          },)),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),
              
              ),
              
            ),
           child: Column(
            children: [
              SizedBox(
                child: const Center(child: Text('Загрузить свою историю'),),
              ),
              Row(
                children: [
                  Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets\image_templets_books.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                           
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView(
                            children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Автор', style: TextStyle(fontSize: 18)),
                                const SizedBox(height: 8),
                                const Text('Жанр', style: TextStyle(fontSize: 18)),
                                const SizedBox(height: 16),
                                const Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      'Тут будет краткое описание книги.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle the button tap here
                                  },
                                  child: const Text('Читать сейчас'),
                                ),
                              ],
                            ),
                            ],
                          ),
                        ),
                      ),
                ],
              )
            ],
           ),
          ),
        ],
      ),
    );
  }
}



  //Автор
                    // Название книги
                    // Краткое описание
                    // Описание полное
                    // Обложка
                    // Авторство
                    //Кнопки? Отмена? Отправить
                    //Если есть пустые места то подсвечивать красным или отправлять пусш уведомление SnackBar
                    //Слева возможность добавить свою обложку книги
                    //Справа то что сверху,
                    //Уменьшить пустое место сверху, добавить кнопку выхода(закрытия всплывающего меню)    
                    //Реализовать функцию отправки на модерацию (на почту или в телегу для пусшего эффекта ъаъаъаъ)
                    //     