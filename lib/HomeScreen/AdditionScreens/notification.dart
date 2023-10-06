import 'package:flutter/material.dart';
import 'package:readerabooks/HomeScreen/WidgetsToSTF/cards/CardsToNotif.dart';

class NotificationScreens extends StatefulWidget {
  const NotificationScreens({super.key});

  @override
  State<NotificationScreens> createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,leading: IconButton(
    icon: Icon(Icons.chevron_left), // Замените "new_icon" на иконку, которую вы хотите использовать
    onPressed: () {
      Navigator.pop(context);
    },
    
  ),
  title: Text('Notifications', style:Theme.of(context).primaryTextTheme.bodyText1),
  
  
  ),
    body: SingleChildScrollView(
      child: Wrap(
        children: List.generate(10, (index) => CardsNotification())
      ),
    ),
    );
  }
}