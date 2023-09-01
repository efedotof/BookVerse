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
import 'package:magazine/tools/reader.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

// ignore: camel_case_types
class Shared_link extends StatefulWidget {
  const Shared_link({super.key,
    required this.mode,
  });
    final bool mode;
  @override
  State<Shared_link> createState() => _Shared_linkState();
}

// ignore: camel_case_types
class _Shared_linkState extends State<Shared_link> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container()),
          Expanded(child: Container()),
          Container(
            color:widget.mode? Colors.black: Colors.white,
            child: Column(
              children: [
                Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              Text('Поделиться', style: TextStyle(color: widget.mode?Colors.white:Colors.black),),
              Expanded(child: Container()),
              IconButton(onPressed: (){BookReaders.of(context)!.init_share_plus();}, icon: Icon(Icons.arrow_back,color: widget.mode? Colors.white: Colors.black,)),
            ],
          ),
                Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){

              }, icon: Icon(SocialMediaIcons.twitter, color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.facebook,color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.whatsapp,color: widget.mode? Colors.white: Colors.black,)),
            ],
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.github_circled,color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.pinterest,color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.reddit,color: widget.mode? Colors.white: Colors.black,)),
            ],
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.skype,color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.instagram,color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(SocialMediaIcons.google,color: widget.mode? Colors.white: Colors.black,)),
            ],
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit,color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit,color: widget.mode? Colors.white: Colors.black,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit,color: widget.mode? Colors.white: Colors.black,)),
            ],
          ),
              ],
            ),
          )
        ],
    );
  }
}