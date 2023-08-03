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


import 'package:flutter/material.dart';
import 'package:magazine/screens/home.dart';

class AdditionalContinuationWidget extends StatefulWidget {
  const AdditionalContinuationWidget({super.key,
    
  });


  @override
  State<AdditionalContinuationWidget> createState() => _AdditionalContinuationWidgetState();
}

class _AdditionalContinuationWidgetState extends State<AdditionalContinuationWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, // затемнение экрана
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          Expanded(child: Container()),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 1),
                            ),
                          ],
            
            ),
            
            
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Это ваш аккаунт /'),
                TextButton(onPressed: () async  {
                  
                  Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Home()),
                        );



                }, child: const Text('Завершить регистрацию'))
              ],
            ),
          ),
        ]
      )
    );
  }
}