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
import 'package:flutter/services.dart';
import 'package:magazine/tools/app_bar.dart';
import 'package:animations/animations.dart';
import 'package:magazine/tools/pagination.dart';
import 'SettingsMenu.dart';
import 'bottom.dart';
import 'message.dart';
import 'model/eye_protect_mode.dart';
import 'model/fullScreen.dart';

class BookReaders extends StatefulWidget {
  const BookReaders({
    super.key,
    // ignore: non_constant_identifier_names
    required this.size_heigth,
    // ignore: non_constant_identifier_names
    required this.size_width,
    // required this.pages,
    required this.title,
    required this.theme,
    required this.isLoading,
    required this.text,
    required this.paddings,
  });
  // ignore: non_constant_identifier_names
  final double size_heigth;
  // ignore: non_constant_identifier_names
  final double size_width;
  // final List<String> pages;
  final String title;
  final Color theme;
  final bool isLoading;
  final String text;
  final double paddings;
  // ignore: library_private_types_in_public_api
  static _BookReadersState? of(BuildContext context) {
    return context.findAncestorStateOfType<_BookReadersState>();
  }

  @override
  State<BookReaders> createState() => _BookReadersState();
}

class _BookReadersState extends State<BookReaders> {
  bool showOverlay = false;
  // ignore: non_constant_identifier_names
  bool share_init_bool = false;
  int index = 0;
  int previousIndex = 0;
  bool showSettingsMenu = false;
  bool isDarkMode = false;
  bool exits = false;
  bool eyeProtectionEnabled = false;
  bool fullscreens = false;
  // ignore: non_constant_identifier_names
  double font_size = 18;
  bool isAutoReader = false;
  double scrollSpeed = 0.5;
  List<String> pages = [];
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    // pages = splitText(
    //           widget.text, font_size, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 40); //FlutterError (dependOnInheritedWidgetOfExactType<MediaQuery>() or dependOnInheritedElement() was called before _BookReadersState.initState() completed.When an inherited widget changes, for example if the value of Theme.of() changes, its dependent widgets are rebuilt. If the dependent widget's reference to the inherited widget is in a constructor or an initState() method, then the rebuilt dependent widget will not reflect the changes in the inherited widget. Typically references to inherited widgets should occur in widget build() methods. Alternatively, initialization based on inherited widgets can be placed in the didChangeDependencies method, which is called after initState and whenever the dependencies change thereafter.)
  }


  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  pages = splitText(
    widget.text,
    font_size,
    MediaQuery.of(context).size.width,
    MediaQuery.of(context).size.height,
  );
    isLoading = false;



}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
      systemNavigationBarColor: isDarkMode ? Colors.black : widget.theme,
      statusBarColor: isDarkMode ? Colors.black : widget.theme,

    ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : widget.theme,
        toolbarHeight: 3,
        actions: [],
        elevation: 0,
      ),
      body:isLoading? Center(child: CircularProgressIndicator(),) : GestureDetector(
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
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                        child: child,
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
                          pages[index],
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
                    end: pages.length - 1,
                    mode: isDarkMode),
              ],
            ),
            if (isDarkMode == false && eyeProtectionEnabled)
               EyeProtectionOverlay(showOverlay: showOverlay,),
            if(fullscreens) FullScreenMode(showOverlay: showOverlay,),
            if (showSettingsMenu)
              SettingsMenu(
                index: index,
                fullscreens: fullscreens,
                eyeProtectionEnabled: eyeProtectionEnabled,
                mode: isDarkMode,
                links: share_init_bool,
              ),
          ],
        ),
      ),
    );
  }

  void fullscrensInit(){
    setState(() {
      fullscreens = !fullscreens;
    });
  }



  //font size
  // ignore: non_constant_identifier_names
  void Reducing_the_font_size(){
    setState(() {
      font_size -= 1;
      pages = splitText(
    widget.text,
    font_size,
    MediaQuery.of(context).size.width,
    MediaQuery.of(context).size.height - 40,
  );
    });
  }

  // ignore: non_constant_identifier_names
  void Increasing_the_font_size(){
    setState(() {
      font_size += 1;
      pages = splitText(
    widget.text,
    font_size,
    MediaQuery.of(context).size.width,
    MediaQuery.of(context).size.height - 40,
  );
    });
  }

  void reset(){
    setState(() {
      font_size = 18;
      pages = splitText(
    widget.text,
    font_size,
    MediaQuery.of(context).size.width,
    MediaQuery.of(context).size.height - 40,
  );
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
        duration: const Duration(seconds: 2),
        message: 'Режим защиты глаз доступен только в режиме "День"');
  }
  
  // Toggle system overlays based on the value of `showOverlay`
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: showOverlay ? SystemUiOverlay.values : [],
  );
}

void setBrightness(int brightness) {
  if (brightness > 0 && brightness <= 255) {
    try {
      // Вызываем метод платформы для установки яркости
      SystemChannels.platform
          .invokeMethod('SystemBrightness.set', brightness / 255);
      // ignore: empty_catches
    } catch (e) {}
  }
}

void setYellowScreen() {
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
      systemNavigationBarColor: isDarkMode ? Colors.black : widget.theme,
      statusBarColor: isDarkMode ? Colors.black : widget.theme,

    ),
    );
}

void setDefaultScreen() {
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
      systemNavigationBarColor:  isDarkMode ? Colors.black : widget.theme,
      statusBarColor:  isDarkMode ? Colors.black : widget.theme,
    
    ),
  );
}

  //share_plus
  // ignore: non_constant_identifier_names
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
            duration: const Duration(seconds: 2), message: 'уже первая страница');
        setState(() {
          index = 0;
        });
      }
      debugPrint("$index");
    } else if (position.dx > width ~/ 3 * 2) {
      debugPrint("Перелистывание вправо");
      setState(() {
        if (index < pages.length - 1) {
          if(showOverlay == false){
            setState(() {
              index += 1;
            }); 
          }
          
        } else {
          index = pages.length - 1;
          Message.show(context,
              duration: const Duration(seconds: 2),
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
