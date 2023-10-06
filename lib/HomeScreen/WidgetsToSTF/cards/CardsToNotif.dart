import 'package:flutter/material.dart';

class CardsNotification extends StatefulWidget {
  const CardsNotification({super.key});

  @override
  State<CardsNotification> createState() => _CardsNotificationState();
}

class _CardsNotificationState extends State<CardsNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.amber,
                     shape: BoxShape.circle
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name Author', style: Theme.of(context).primaryTextTheme.bodyText1,),
                      Text('Push', style: Theme.of(context).primaryTextTheme.bodyText2)
                    ],
                  )
          ],
        ),
      ),
    );
  }
}