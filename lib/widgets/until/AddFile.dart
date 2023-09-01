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
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:magazine/list_data_text.dart';
import 'package:magazine/tools/model/pdfReader.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:magazine/screens/list_page/list_page_2.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:magazine/widgets/until/TextField.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../tools/model/fb2Readers.dart';
import '../../tools/pagination.dart';
import '../../tools/reader.dart';
import 'AuthUntil/UserModel.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  final name = TextEditingController();
  final author = TextEditingController();
  final genger = TextEditingController();
  final description = TextEditingController();
  final format = TextEditingController();

  File? pushFiles;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel model = UserModel();

  void _showModal(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Внимание"),
        content: Container(
          height: 300,
          child: Column(
            children: [
              Lottie.asset(
                  'assets/animation_lk9jg8ww.json'), // Замените 'assets/loading.json' на путь к вашему Lottie файлу
              SizedBox(height: 16),
              Text(
                "Функция чтения .mobi и .epub в данный момент недоступна, но в скором времени она появится.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Закрыть"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<String> pickAndReadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return '';

    String extension = result.files.first.extension ?? '';
    File file = File(result.files.first.path!);

    if (extension == 'fb2') {
       showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Цвет фона
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Container(
            width: 100,
            height: 100,
            child: SpinKitCircle(
              color: Colors.blue,
              size: 40.0,
            ),
          ),
        );
      },
    );
      return await readFb2File(file);
    } else if (extension == 'mobi') {
       showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Цвет фона
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Container(
            width: 100,
            height: 100,
            child: SpinKitCircle(
              color: Colors.blue,
              size: 40.0,
            ),
          ),
        );
      },
    );
      return 'mobi';
    } else if (extension == 'pdf') {
       showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Цвет фона
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Container(
            width: 100,
            height: 100,
            child: SpinKitCircle(
              color: Colors.blue,
              size: 40.0,
            ),
          ),
        );
      },
    );
      return await readPdfFile(file);
    } else if (extension == 'epub') {
       showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Цвет фона
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Container(
            width: 100,
            height: 100,
            child: SpinKitCircle(
              color: Colors.blue,
              size: 40.0,
            ),
          ),
        );
      },
    );
      return 'epub';
    } else {
      return '';
    }
  }

  Future<File?> pickAndPushFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return null;

    String extension = result.files.first.extension ?? '';
    File file = File(result.files.first.path!);

    if (extension == 'fb2') {
      pushFiles = file;
    } else if (extension == 'mobi') {
      pushFiles = file;
    } else if (extension == 'pdf') {
      pushFiles = file;
    } else if (extension == 'epub') {
      // Можете добавить обработку для epub, если нужно
      pushFiles = file;
    } else {
      return null;
    }
  }

  Future setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('nameHistory', extraNameChild);
    prefs.setStringList('imageHistory', extraimgChild);
    prefs.setStringList('TextHistory', extraTextChild);
    prefs.setStringList('AuthorHistory', extraAuthorChild);
    prefs.setStringList('GenreHistory', extraGenreChild);
  }

  File? _image;

  Future _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;
    final imageTemp = File(pickedFile.path);
    setState(() {
      this._image = imageTemp;
    });
  }

  Future pushingFiles() async {
    sendEmail(
        'sbookverse@gmail.com',
        'Добавление книги',
        """<!DOCTYPE html>
                                                                          <html lang="en">
                                                                          <head>
                                                                              <meta charset="UTF-8">
                                                                              <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                                          
                                                                          </head>
                                                                          <body>
                                                                              <div class="container">
                                            <div class="header">
                                                <h1>Запрос на добавление электронной книги</h1>
                                            </div>
                                            <div class="content">
                                                <p>Уважаемая команда разработчиков приложения,</p>
                                                <p>Я хотел бы предложить добавить новую электронную книгу в наше приложение. Книга имеет следующие характеристики:</p>
                                                <ul>
                                                    <li>Название: ${name.text}</li>
                                                    <li>Автор: ${author.text}</li>
                                                    <li>Жанр: ${genger.text}</li>
                                                    <li>Формат: ${format.text}</li>
                                                    
                                                    <li>Описание: ${description.text}</li>
                                                </ul>
                                                <p>Пожалуйста, дайте мне знать, если вы заинтересованы в добавлении этой книги.</p>
                                                <p>С уважением, ${author.text}</p>
                                                <p>${model.uid}</p>
                                            </div>
                                                                              </div>
                                                                          </body>
                                                                          </html>
                                                                          
                                                                          
                                                                          """,
        pushFiles!,
        _image!, name.text, );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user!.uid)
    //     .get()
    //     .then((value) {
    //   this.model = UserModel.fromMap(value.data());
    //   setState(() {
    //     if (model.email != null &&
    //         model.name != null &&
    //         model.nickname != null) {}
    //   });
    // });
  }

  Future pushandPublishFiles() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(
                child: const Text('Заполните данные'),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller: name,
                        hintText: 'Название книги',
                        obscureText: false,
                      ),
                      MyTextField(
                        controller: author,
                        hintText: 'Автор: ФИО или никнейм',
                        obscureText: false,
                      ),
                      MyTextField(
                        controller: genger,
                        hintText: 'Жанр: Комедия, Детектив и т.д.',
                        obscureText: false,
                      ),
                      MyTextField(
                        controller: description,
                        hintText: 'Краткое описание',
                        obscureText: false,
                      ),
                      MyTextField(
                        controller: format,
                        hintText: 'Формат: PDF/Mobi/Epub/Fb2/Doc',
                        obscureText: false,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              TextButton(   
                                onPressed: () async {
                                  await _getImage();
                                  setState(() {}); // Обновляем состояние
                                },
                                child: Text('Добавить обложку'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await pickAndPushFile();
                                  setState(() {}); // Обновляем состояние
                                },
                                child: Text('Добавить файл'),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                  _image != null
                                      ? Icons.check_box
                                      : Icons.close,
                                  color: _image != null
                                      ? Colors.green
                                      : Colors.red),
                              const SizedBox(
                                height: 15,
                              ),
                              Icon(
                                  pushFiles != null
                                      ? Icons.check_box
                                      : Icons.close,
                                  color: pushFiles != null
                                      ? Colors.green
                                      : Colors.red),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 100,
                        child: TextButton(
                            onPressed: () {
                              if (name.text.isNotEmpty &&
                                  author.text.isNotEmpty &&
                                  genger.text.isNotEmpty &&
                                  description.text.isNotEmpty &&
                                  format.text.isNotEmpty &&
                                  
                                  _image != null &&
                                  pushFiles != null) {
                                pushingFiles();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text('Не все данные заполнены'),
                                    duration: const Duration(seconds: 3),
                                    shape: const StadiumBorder(),
                                  ),
                                );
                              }
                            },
                            child: const Text('Отправить')),
                      )
                    ],
                  ),
                ]),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> sendEmail(String recipient, String subject, String body,
      File attachment, File image, String name) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipient],
      attachmentPaths: [attachment.path],
      isHTML: true,
    );

    if (image != null) {
      final String imageAttachmentPath = image.path;
      email.attachmentPaths?.add(imageAttachmentPath);
    }

    try {
      DateTime now = DateTime.now();
      await FlutterEmailSender.send(email);
      Auth().addStatusData(name, "${now.day}.${now.month}.${now.year}", 'На рассмотрении', model.uid!, author.text, description.text, genger.text);
      Navigator.of(context).pop();
    } catch (error) {
      print(error);
    }

    if (!mounted) return;
  }

  Future handlePressed(BuildContext context, text) async {
  setPrefs();
  try {
    List<String> lines = text.split('\n');
    String author = lines[0];
    String title = lines[1];

    await Future.delayed(Duration(seconds: 2));

    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookReaders(
          size_heigth: MediaQuery.of(context).size.height,
          size_width: MediaQuery.of(context).size.width,
          // pages: splitText(
          //     text, 18, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 40),
          title: title + author,
          theme: Colors.white,
          isLoading: false,
          text: text,
          paddings: 16,
        ),
      ),
    );
  } catch (e) {
    print(e);
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(child: GestureDetector(
            onTap: () {
              List_views_2.of(context)!.initShowAddFiles();
            },
          )),
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
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade500,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: OutlinedButton(
                    onPressed: () async {
                      try {
                        String Texts = await pickAndReadFile();
                        if (Texts == 'mobi' || Texts == 'epub') {
                          _showModal(context);
                        } else {
                          if (Texts != null) {
                             showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Цвет фона
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Container(
            width: 100,
            height: 100,
            child: SpinKitCircle(
              color: Colors.blue,
              size: 40.0,
            ),
          ),
        );
      },
    );
                            List<String> lines = Texts.split('\n');
                            if (lines.length >= 2) {
                              String author = lines[0];
                              String title = lines[1];
                              extraAuthorChild.add(' ');
                              extraGenreChild.add('Пользовательский файл');
                              extraNameChild.add(title);
                              extraimgChild.add(
                                  'assets/elseNoConnection.jpg');
                              extraTextChild.add(Texts);
                              handlePressed(context, Texts);
                            } else {
                              print('Ошибка: Файл содержит недостаточно строк');
                            }
                          }
                        }
                      } catch (error) {
                        print('Произошла ошибка: $error');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      'Загрузить из файла',
                      style: TextStyle(
                        color: Colors.white, // Белый цвет текста
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //   width: 300,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     color: Colors.blue.shade500,
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: OutlinedButton(
                //     onPressed: () {
                //       pushandPublishFiles();
                //     },
                //     style: OutlinedButton.styleFrom(
                //       side: BorderSide.none,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(30)),
                //     ),
                //     child: const Text(
                //       'Загрузить свою историю',
                //       style: TextStyle(
                //         color: Colors.white, // Белый цвет текста
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
