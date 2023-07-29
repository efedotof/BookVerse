
// ignore_for_file: file_names

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

import 'package:flutter/material.dart';
import 'package:magazine/widgets/list_page/list_page_2.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, 
      child: Column(
        children: [
          Expanded(child: GestureDetector(onTap: () {
           List_views_2.of(context)!.initShowAddFiles();
           


          },)),
          Container(
                  height: MediaQuery.of(context).size.height / 5,
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
                      OutlinedButton(onPressed: (){}, child: const Text('Загрузить из файла')),
                      OutlinedButton(onPressed: (){}, child: const Text('Загрузить свою историю')),
                    
                    ],
                  ),
                ),
             
        ],
      ),
    );
  }
}