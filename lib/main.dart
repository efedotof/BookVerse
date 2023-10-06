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
import 'package:flutter/services.dart';
import 'package:readerabooks/LoginScreen/Login.dart';
import 'package:readerabooks/Definingpage/DefiningPage.dart';
import 'package:readerabooks/StartScreens/Start.dart';
import 'package:readerabooks/ThemeMyApp/CustomTheme.dart';
import 'package:readerabooks/ThemeMyApp/config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:readerabooks/ThemeMyApp/localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await CustomTheme().loadTheme();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: currentTheme.currentTheme == ThemeMode.dark
      ? CustomTheme.darkTheme.primaryColor
      : CustomTheme.lightTheme.primaryColor,
));
        return MaterialApp(
         localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ru'),
        Locale('uk'),
        Locale('en'),
        Locale('be'),
        Locale('kk'),
        Locale('hy'),
        Locale('ka'),
        Locale('az'),
        Locale('mo'),
        Locale('tg'),
        Locale('uz'),
        Locale('lv'),
        Locale('lt'),
        Locale('et'),
        Locale('de'),
        Locale('fr'),
        Locale('it'),
        Locale('es'),
        Locale('pt'),
      ],
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: currentTheme.currentTheme,
          initialRoute: '/Start',
          routes: {
            '/Registration': (context) => const DefiningPage(),
            '/Start': (context) => const Start()
          },
          debugShowCheckedModeBanner: false,
    );
  }
}
/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/






  



