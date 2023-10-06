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
import 'package:readerabooks/HomeScreen/WidgetsToSTF/ProfileSettings.dart';
import 'package:readerabooks/HomeScreen/WidgetsToSTF/cards/CardsToSettingsScreens.dart';
import 'package:readerabooks/Model/SettingMenu.dart';
import 'package:readerabooks/ThemeMyApp/CustomTheme.dart';
import 'package:readerabooks/ThemeMyApp/config.dart';

class SettingMenuPages extends StatefulWidget {
  const SettingMenuPages({super.key});

  @override
  State<SettingMenuPages> createState() => _SettingMenuPagesState();
}

class _SettingMenuPagesState extends State<SettingMenuPages> {
  List<SettingMenuItem> menuItems = [
    SettingMenuItem('General', Icons.arrow_drop_down_circle),
    SettingMenuItem('Privacy', Icons.arrow_drop_down_circle),
    SettingMenuItem('Notification', Icons.arrow_drop_down_circle),
    SettingMenuItem('Display', Icons.arrow_drop_down_circle),
    SettingMenuItem('Help', Icons.arrow_drop_down_circle),
  ];

  List<bool> isOpen = [false, false, false, false, false];

  void onTaps1() {}

  bool datastheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Account',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              ProfileSettings(),
              Text(
                'Settings',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              CardsToSettingsScreens(
                  icon: Icons.language,
                  text: 'Language',
                  onTaps: onTaps1,
                  colorToIcons: Color(0xFFF09977)),
              CardsToSettingsScreens(
                  icon: Icons.notifications,
                  text: 'Notifications',
                  onTaps: onTaps1,
                  colorToIcons: Color(0xFF249BCD)),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          color: Color(0xFF513CBF).withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.brightness_3_rounded,
                        color: Color(0xFF513CBF),
                      ),
                    ),
                    Text('Dark Mode',
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                    Switch(
                      splashRadius: 50.0,
                      value: currentTheme.currentTheme == ThemeMode.dark,
                      onChanged: (value) {
                        currentTheme.toggleTheme();
                        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: currentTheme.currentTheme == ThemeMode.dark
      ? CustomTheme.darkTheme.primaryColor
      : CustomTheme.lightTheme.primaryColor,
));
                      },
                    )
                  ],
                ),
              ),
              CardsToSettingsScreens(
                  icon: Icons.group_work,
                  text: 'Help',
                  onTaps: onTaps1,
                  colorToIcons: Color(0xFFE34B6E))
            ],
          ),
        ),
      ),
    );
  }
}
