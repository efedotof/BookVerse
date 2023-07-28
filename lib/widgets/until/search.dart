import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  bool isSearching = false;

  void startSearching() {
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    setState(() {
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200], // Заменим на более светлый цвет
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Иконка для начала поиска
            AnimatedOpacity(
              opacity: isSearching ? 0.0 : 1.0,
              duration: Duration(milliseconds: 300),
              child: IconButton(
                onPressed: startSearching,
                icon: Icon(Icons.search),
              ),
            ),
            // Поле ввода текста поиска
            Expanded(
              child: AnimatedOpacity(
                opacity: isSearching ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: IgnorePointer(
                  ignoring: !isSearching,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      enabled: isSearching, // Позволяем вводить текст только в режиме поиска
                      onChanged: (text) {
                        // Добавьте обработку изменения текста поиска здесь
                      },
                      decoration: InputDecoration(
                        hintText: 'Поиск',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Иконка для закрытия поиска
            AnimatedOpacity(
              opacity: isSearching ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: IconButton(
                onPressed: stopSearching,
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
