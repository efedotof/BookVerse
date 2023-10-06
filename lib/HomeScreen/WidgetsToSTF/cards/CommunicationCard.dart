import 'package:flutter/material.dart';

class CommunicationCard extends StatefulWidget {
  const CommunicationCard({super.key});

  @override
  State<CommunicationCard> createState() => _CommunicationCardState();
}

class _CommunicationCardState extends State<CommunicationCard> {
 @override
Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.09,
    color: Theme.of(context).primaryColor,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Изменим CrossAxisAlignment на center
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
        ),
        SizedBox(width: 8.0), // Добавляем небольшой отступ между кругом и текстом
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center, // Выравниваем текст по центру
              child: Text('Name Author', style: Theme.of(context).primaryTextTheme.bodyText1,),
            ),
            Align(
              alignment: Alignment.center, // Выравниваем текст по центру
              child: Text('Message For me hehehehehe', style: Theme.of(context).primaryTextTheme.bodyText2,),
            ),
          ],
        ),
      ],
    ),
  );
}
}