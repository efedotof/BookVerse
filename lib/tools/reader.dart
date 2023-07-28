import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magazine/tools/app_bar.dart';
import 'package:animations/animations.dart';
import 'package:magazine/tools/pagination.dart';
import 'package:share_plus/share_plus.dart';
import 'SettingsMenu.dart';
import 'bottom.dart';
import 'message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/eye_protect_mode.dart';
import 'model/shared_link_social.dart';

class BookReaders extends StatefulWidget {
  const BookReaders({
    super.key,
    required this.size_heigth,
    required this.size_width,
    required this.pages,
    required this.title,
    required this.theme,
    required this.isLoading,
    required this.text,
    required this.paddings,
  });
  final double size_heigth;
  final double size_width;
  final List<String> pages;
  final String title;
  final Color theme;
  final bool isLoading;
  final String text;
  final double paddings;
  static _BookReadersState? of(BuildContext context) {
    return context.findAncestorStateOfType<_BookReadersState>();
  }

  @override
  State<BookReaders> createState() => _BookReadersState();
}

class _BookReadersState extends State<BookReaders> {
  bool showOverlay = false;
  bool share_init_bool = false;
  int index = 0;
  int previousIndex = 0;
  bool showSettingsMenu = false;
  bool isDarkMode = false;
  bool exits = false;
  bool eyeProtectionEnabled = false;
  double font_size = 18;
  bool isAutoReader = false;
  double _scrollOffset = 0.0;
  double scrollSpeed = 0.5;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: showOverlay ? SystemUiOverlay.values : [],
    );
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) => handleTap(context, details),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(title: widget.title, mode: isDarkMode),
                Expanded(
                  child: PageTransitionSwitcher(
                    duration: const Duration(milliseconds: 500),
                    reverse: index < previousIndex,
                    transitionBuilder: (child, animation, secondaryAnimation) {
                      return SharedAxisTransition(
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                      );
                    },
                    child: Container(
                      color: isDarkMode ? Colors.black : widget.theme,
                      width: widget.size_width,
                      padding: EdgeInsets.all(widget.paddings),
                      height: widget.size_heigth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.pages[index]}",
                          style: TextStyle(
                              fontSize: font_size,
                              color: isDarkMode ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                bottom(
                    start: index,
                    end: widget.pages.length - 1,
                    mode: isDarkMode),
              ],
            ),
            if (isDarkMode == false && eyeProtectionEnabled)
              EyeProtectionOverlay(),
            if (showSettingsMenu)
              SettingsMenu(
                index: index,
                mode: isDarkMode,
                links: share_init_bool,
              )
          ],
        ),
      ),
    );
  }

  //font size
  void Reducing_the_font_size(){
    setState(() {
      font_size -= 1;
    });
  }

  void Increasing_the_font_size(){
    setState(() {
      font_size += 1;
    });
  }

  void reset(){
    setState(() {
      font_size = 18;
    });
  }


  //Theme mode
  void isDark() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  //eye protection
  void toggleEyeProtectionMode() {
    if (isDarkMode == false) {
      setState(() {
        eyeProtectionEnabled = !eyeProtectionEnabled;
      });

      if (eyeProtectionEnabled) {
        // Устанавливаем яркость на 50% от максимума (при условии, что максимум равен 255)
        setBrightness(255 ~/ 2);

        // Задаем цвет фона как желтоватый
        setYellowScreen();
      } else {
        // Восстанавливаем исходную яркость
        setBrightness(255);

        // Восстанавливаем стандартный цвет фона (белый)
        setDefaultScreen();
      }
    } else {
      Message.show(context,
          duration: Duration(seconds: 2),
          message: 'Режим защиты глаз доступень только в режиме "День"');
    }
  }

  void setBrightness(int brightness) {
    if (brightness > 0 && brightness <= 255) {
      try {
        // Вызываем метод платформы для установки яркости
        SystemChannels.platform
            .invokeMethod('SystemBrightness.set', brightness / 255);
      } catch (e) {
        print("Ошибка при изменении яркости: $e");
      }
    }
  }

  void setYellowScreen() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.yellow[50],
        statusBarColor: Colors.yellow[50],
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void setDefaultScreen() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  //share_plus
  void init_share_plus(){
    setState(() {
      share_init_bool = !share_init_bool;
    });
  }

  //tap to screen
  void handleTap(BuildContext context, TapUpDetails details) {
    final width = MediaQuery.of(context).size.width;
    final position = details.globalPosition;
    if (position.dx < width ~/ 3 && showSettingsMenu == false) {
      debugPrint("Перелистывание влево");
      setState(() {
        if(showOverlay == false){
          index--;
        }
      });
      if (index < 0) {
        Message.show(context,
            duration: Duration(seconds: 2), message: 'уже первая страница');
        setState(() {
          index = 0;
        });
      }
      debugPrint("$index");
    } else if (position.dx > width ~/ 3 * 2) {
      debugPrint("Перелистывание вправо");
      setState(() {
        if (index < widget.pages.length - 1) {
          if(showOverlay == false){
            setState(() {
              index += 1;
            }); 
          }
          
        } else {
          index = widget.pages.length - 1;
          Message.show(context,
              duration: Duration(seconds: 2),
              message: 'уже последняя страница');
        }
      });
      debugPrint("$index");
    } else {
      debugPrint("Перелистывание вверх");
      if (!showOverlay) {
        setState(() {
          showOverlay = true;
          showSettingsMenu = true;
          share_init_bool = true;
        });
      } else {
        setState(() {
          showOverlay = false;
          showSettingsMenu = false;
        });
      }
    }

    previousIndex = index;
  }
}
