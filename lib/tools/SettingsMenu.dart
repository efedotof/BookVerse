import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:magazine/tools/reader.dart';
import 'package:magazine/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screen_brightness/screen_brightness.dart';

import 'model/shared_link_social.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({
    super.key,
    required this.index,
    required this.mode,
    required this.links,
  });
  final int index;
  final bool mode;
  final bool links;

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  bool isDarkMode = false;
  List<String> list_index = [];
  double _brightnessValue = 1;
  bool eyeProtectionEnabled = false;
  double font_size = 18;

  void save_preference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    list_index.add("${widget.index}");
    await prefs.setStringList('index', list_index);
    debugPrint('${list_index[0]}');
    await prefs.setDouble('_brightnessValue', _brightnessValue);
    await prefs.setBool('eyeProtectionEnabled',eyeProtectionEnabled);
  }

  void get_prefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _brightnessValue = prefs.getDouble('_brightnessValue') ?? 1;
    });
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
      save_preference();
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    get_prefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, // затемнение экрана
      child: widget.links? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color:widget.mode? Colors.black:Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Home(), // Navigate to the TargetPage
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_back, size: 18, color: widget.mode?Colors.white:Colors.black,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Закладки'),
                                content: ListView(
                                  children: [
                                    for (int i = 0; i < list_index.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "Страница ${list_index[i]}"),
                                                Icon(Icons.book),
                                              ],
                                            )),
                                      )
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Закрыть'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: IconButton(
                            onPressed: () {
                              save_preference();
                            },
                            icon: Icon(
                              Icons.bookmark,
                              size: 18,
                              color: widget.mode?Colors.white:Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width,
            color: widget.mode?Colors.black:Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // кнопки
                      Text('Яркость',style: TextStyle(color:widget.mode?Colors.white:Colors.black),),
                      IconButton(
                        onPressed: () {
                          setState(() {
                              if(_brightnessValue < 1){
                                _brightnessValue += 0.1;
                              }
                                });
                                setBrightness(_brightnessValue);
                        },
                        icon: Icon(Icons.light_mode_outlined,color:widget.mode?Colors.white:Colors.black),
                      ),
                      Expanded(
                          child: Slider.adaptive(
                              value: _brightnessValue,
                              activeColor: widget.mode?Colors.white:Colors.black,
                              onChanged: (value) {
                                setState(() {
                                  _brightnessValue = value;
                                });
                                setBrightness(value);
                              })),
                      IconButton(
                        onPressed: () {
                          setState(() {
                                if(_brightnessValue > 0){
                                  _brightnessValue -= 0.1;
                                }
                                });
                                setBrightness(_brightnessValue);
                        },
                        icon: Icon(Icons.wb_sunny_outlined, color:widget.mode?Colors.white:Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // кнопки
                       Text('Шрифта',style:TextStyle(color:widget.mode?Colors.white:Colors.black)),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            font_size--;
                          });
                          BookReaders.of(context)?.Reducing_the_font_size();
                        },
                        child: Icon(Icons.text_decrease_outlined,color:widget.mode?Colors.white:Colors.black),
                      ),
                      Text(' ${font_size.toInt()} ',style:TextStyle(color:widget.mode?Colors.white:Colors.black)),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            font_size++;
                          });
                          BookReaders.of(context)?.Increasing_the_font_size();
                        },
                        child:  Icon(Icons.text_increase_outlined,color:widget.mode?Colors.white:Colors.black),
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
    primary: widget.mode ? Colors.black : Colors.white, // Цвет фона кнопки
    // Другие свойства стиля кнопки (если нужно)
  ),
                            onPressed: () {
                              setState(() {
                                font_size = 18;
                              });
                              BookReaders.of(context)?.reset();
                            }, child:  Text('Сбросить',style: TextStyle(color:widget.mode?Colors.white:Colors.black),)),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // кнопки
                //       Expanded(
                //           child: ElevatedButton.icon(
                //             onPressed:(){},

                //             icon: const Icon(Icons.chat_outlined),
                //             label: const Text('Рецензия на книгу'),
                //           ),
                //         ),
                //         const SizedBox(width: 8),
                //         Expanded(
                //           child: ElevatedButton.icon(
                //             onPressed:(){},

                //             icon: const Icon(Icons.change_circle_outlined),
                //             label: const Text('Изменить источник'),
                //           ),
                //         ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            BookReaders.of(context)?.isDark();
                          });
                        },
                        child: Column(
                          children: [
                            Icon(widget.mode
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,color:widget.mode?Colors.white:Colors.black),
                            Text(widget.mode
                                ? 'День'
                                : 'Ночь',style:TextStyle(color:widget.mode?Colors.white:Colors.black)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Column(
                          children:  [
                            Icon(Icons.download,color:widget.mode?Colors.white:Colors.black),
                            AutoSizeText('Cкачать', maxFontSize: 13,style: TextStyle(color:widget.mode?Colors.white:Colors.black),),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed:(){
                          BookReaders.of(context)?.init_share_plus();
                        },
                        child: Column(
                          children:  [
                            Icon(Icons.link_sharp,color:widget.mode?Colors.white:Colors.black),
                            AutoSizeText('Поделиться', maxFontSize: 13,style:TextStyle(color:widget.mode?Colors.white:Colors.black)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          setState(() {
                            BookReaders.of(context)?.toggleEyeProtectionMode();
                          });
                          
                        },
                        child: Column(
                          children:  [
                            Icon(Icons.visibility_outlined,color:widget.mode?Colors.white:Colors.black),
                            AutoSizeText('Режим защиты глаз', maxFontSize: 13,style:TextStyle(color:widget.mode?Colors.white:Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ):Shared_link(mode: widget.mode,),
    );
  }
}
