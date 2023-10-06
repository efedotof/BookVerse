import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readerabooks/HomeScreen/WidgetsToSTF/cards/CardsToBookStore.dart';
import 'package:readerabooks/Model/Card.dart';

class BookShare extends StatefulWidget {
  const BookShare({super.key});

  @override
  State<BookShare> createState() => _BookShareState();
}

class _BookShareState extends State<BookShare> {
  int _current = 0;
  int _currentpage = 0;
  String _currentGenre = 'Science Fiction';

  List<String> genreBook = [
    "Science Fiction",
    "Fantasy",
    "Mystery",
    "Romance",
    "Thriller",
    "Horror",
    "Adventure",
    "Non-fiction",
    "Biography",
    "Historical Fiction",
    "Dystopian",
    "Poetry",
    "Self-Help",
    "Cookbook",
    "Graphic Novel",
    "Young Adult",
    "Children's",
  ];

  ModelCard card = ModelCard(
    title: 'Hello, World< its mine',
    author: 'Author Test Modes',
    rating: 3,
    genre: "Science Fiction",
  );

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      enlargeCenterPage: false,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(i.toString())),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      _controller.animateToPage(entry.key);
                      setState(() {
                        _current = entry.key;
                      });
                    },
                    child: Container(
                      width: _current == entry.key ? 20.0 : 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: _current == entry.key ? 4.0 : 1.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Color(0xFF79BCA6)
                                : Color(0xFF81B3B1))
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  genreBook.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentpage = index;
                                _currentGenre = genreBook[index];
                              });
                            },
                            child: Column(
                              children: [
                                Text(genreBook[index], style: Theme.of(context).primaryTextTheme.bodyText1,),
                                _currentpage == index
                                    ? Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).indicatorColor,
                                        ),
                                      )
                                    : Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                        ),
                                      )
                              ],
                            )),
                      )),
            ),
          ),
          Wrap(
            children: List.generate(30, (index) {
              if (card.genre == _currentGenre) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardsToBookStore(
                    title: card.title,
                    rating: card.rating,
                    genre: card.genre,
                    author: card.author,
                  ),
                );
              } else {
                return Container(color: Colors.black);
              }
            }),
          )
        ],
      ),
    );
  }
}
