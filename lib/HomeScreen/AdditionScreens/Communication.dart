import 'package:flutter/material.dart';

import 'package:readerabooks/HomeScreen/WidgetsToSTF/cards/CommunicationCard.dart';

class Communication extends StatefulWidget {
  const Communication({super.key});

  @override
  State<Communication> createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:List.generate(20, (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommunicationCard(),
        ))
      ),
    );
  }
}