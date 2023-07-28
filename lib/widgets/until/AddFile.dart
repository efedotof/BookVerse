


import 'package:flutter/material.dart';
import 'package:magazine/widgets/list_page/list_page_2.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width, 
      child: Column(
        children: [
          Expanded(child: GestureDetector(onTap: () {
           List_views_2.of(context)!.initShowAddFiles();
           


          },)),
          Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Image on the left
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://marketplace.canva.com/EADx4IPoPNo/1/0/1024w/canva-%D0%BE%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0-%D0%BA%D0%BD%D0%B8%D0%B3%D0%B8-%D0%B2-%D0%B6%D0%B0%D0%BD%D1%80%D0%B5-%D1%82%D1%80%D0%B8%D0%BB%D0%BB%D0%B5%D1%80%D0%B0-%D1%81-%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC-%D0%BC%D0%BE%D0%BD%D0%BE%D1%85%D1%80%D0%BE%D0%BC%D0%BD%D0%BE%D0%B9-%D1%84%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%B8-%D0%BB%D0%B5%D1%81%D0%B0-iRBldJ_jyLw.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                           
                          ),
                        ),
                      ),
                      // Details on the right
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Автор', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 8),
                              Text('Жанр', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 16),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    'Тут будет краткое описание книги.',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle the button tap here
                                },
                                child: Text('Читать сейчас'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
             
        ],
      ),
    );
  }
}