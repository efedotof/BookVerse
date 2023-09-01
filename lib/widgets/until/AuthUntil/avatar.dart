/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-07-31                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Auth.dart';


class AvatarCreat extends StatefulWidget {
  const AvatarCreat({super.key,

  });

  @override
  State<AvatarCreat> createState() => _AvatarCreatState();
}






class _AvatarCreatState extends State<AvatarCreat> {
  final TextEditingController _controller = TextEditingController();
  final List<Widget> _painters = <Widget>[];
  bool isAvatarSelected = false;
  File? _image;

  Future _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;
    final imageTemp = File(pickedFile.path);
    setState(() {
      this._image = imageTemp;
      isAvatarSelected = true;
    });


  }





  void handleContinue() async {
    Auth().uploadImage(context, _image);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Выберите аватар'),
                      const SizedBox(height: 30),
                      Material(
                          // Wrap the avatar with Material widget for highlighting effect

                          borderRadius: BorderRadius.circular(39),
                          child: CircleAvatar(
                            radius: 70,
                            child: _image != null
                                ? ClipOval(
                                    child: Image.file(
                                      _image!,
                                      width:
                                          140, // Double the radius to ensure the image fits within the circle
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : null,
                          )),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade500,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            // SavePrefs();
                            // log(svg);
                            // print('Сохранено');
                            // selectAvatar();
                            _getImage();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            _image == null ? 'Выбрать' : 'Изменить',
                            style: TextStyle(
                              color: Colors.white, // Белый цвет текста
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ничего не подобрали ?'),
                    TextButton(
                      onPressed: () {
                        Auth().noImages(context);
                      },
                      child: const Text('Выбрать позже'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: isAvatarSelected,
            child: Positioned(
              top: 16.0,
              right: 16.0,
              child: ClipOval(
                child: Material(
                  color: Colors.blue, // Button color
                  child: InkWell(
                    onTap:
                        handleContinue, // Call the handleContinue function here
                    child: const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white, // Icon color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
