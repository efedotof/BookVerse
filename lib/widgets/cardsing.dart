import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:magazine/lib_chito/pagination.dart';
import 'package:magazine/lib_chito/reader.dart';
import 'list_data_text.dart';
import 'package:shared_preferences/shared_preferences.dart';


class cards extends StatefulWidget {
  const cards({super.key,
    required this.books,
    required this.indexs,
    required this.image_netvorsk,
  });
  final List books;
  final int indexs;
  final String image_netvorsk;
  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {

  Future<void> handlePressed(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: 150,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.0),
              Text('Загрузка данных...'),
            ],
          ),
        ),
      );
    },
  );
  Future.delayed(Duration(seconds: 2), () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookReaders(
          text:"jhsajdhkashdkjashdjashdkjashdjhaskjdh",
          size_heigth: MediaQuery.of(context).size.height,
          size_width: MediaQuery.of(context).size.width,
          theme: Colors.white,
          isLoading: false,
          title: "${widget.books[widget.indexs]}",
          pages: splitText(string_text, (MediaQuery.of(context).size.height).toInt() - 40 - 40),
          paddings: 20.0,

        ),
      ),
    );
  });
}




//   void handlePressed(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return Dialog(
//         child: Container(
//           height: 150,
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(height: 16.0),
//               Text('Загрузка данных...'),
//             ],
//           ),
//         ),
//       );
//     },
//   );

//   Future.delayed(Duration(seconds: 2), () {
//     Navigator.of(context).pop();
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => BookReader(
//           future: Hello_neingo,
//           name: 'Руслан и Людмила',
//         ),
//       ),
//     );
//   });
// }

  void save_preference() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('name',extraNameChild);
    await prefs.setStringList('img',extraimgChild);
    debugPrint('готово');
  }

  


  @override
  Widget build(BuildContext context) {
    return Container(
    width: 150,
    height: 400,
    child: Card(
       elevation: 0,
      child: Column(
        children: [
          Container(
            height: 200,
            width: 150,
            child: IconButton(
                onPressed: () async{
                  extraNameChild.add("${widget.books}");
                  extraimgChild.add(widget.image_netvorsk);
                  handlePressed(context);
                  save_preference();
                },
                icon: Image.network('${widget.image_netvorsk}', fit: BoxFit.fill,),
              ),
          ),
          Container(
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: Center(child: AutoSizeText("${widget.books[widget.indexs]}", maxLines: 2, maxFontSize: 18,)),
           ), 
        ],
      ),
      
    ),
  );
  }
}



// Widget cards(BuildContext context, List books, int indexs, image_netvorsk){
//   // Future<String> Hello_neingo(int index) {

//   //   return Future.value('${string_text[index]}');
//   // }
  
//   Future<void> handlePressed(BuildContext context) async {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return Dialog(
//         child: Container(
//           height: 150,
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(height: 16.0),
//               Text('Загрузка данных...'),
//             ],
//           ),
//         ),
//       );
//     },
//   );
//   Future.delayed(Duration(seconds: 2), () {
//     Navigator.of(context).pop();
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => BookReaders(
//           text:"jhsajdhkashdkjashdjashdkjashdjhaskjdh",
//           size_heigth: MediaQuery.of(context).size.height,
//           size_width: MediaQuery.of(context).size.width,
//           theme: Colors.white,
//           isLoading: false,
//           title: "",
//           pages: splitText(string_text, (MediaQuery.of(context).size.height).toInt() - 40 - 40),
//           paddings: 20.0,

//         ),
//       ),
//     );
//   });
// }




// //   void handlePressed(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     barrierDismissible: false,
// //     builder: (BuildContext context) {
// //       return Dialog(
// //         child: Container(
// //           height: 150,
// //           padding: EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               CircularProgressIndicator(),
// //               SizedBox(height: 16.0),
// //               Text('Загрузка данных...'),
// //             ],
// //           ),
// //         ),
// //       );
// //     },
// //   );

// //   Future.delayed(Duration(seconds: 2), () {
// //     Navigator.of(context).pop();
// //     Navigator.of(context).push(
// //       MaterialPageRoute(
// //         builder: (context) => BookReader(
// //           future: Hello_neingo,
// //           name: 'Руслан и Людмила',
// //         ),
// //       ),
// //     );
// //   });
// // }

//   void save_preference() async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('name',extraNameChild);
//     await prefs.setStringList('img',extraimgChild);
//     debugPrint('готово');
//   }

//   return Container(
//     width: 150,
//     height: 400,
//     child: Card(
//        elevation: 0,
//       child: Column(
//         children: [
//           Container(
//             height: 200,
//             width: 150,
//             child: IconButton(
//                 onPressed: () async{
//                   extraNameChild.add("${books}");
//                   extraimgChild.add(image_netvorsk);
//                   handlePressed(context);
//                   save_preference();
//                 },
//                 icon: Image.network('$image_netvorsk', fit: BoxFit.fill,),
//               ),
//           ),
//           Container(
//              padding: EdgeInsets.all(16.0),
//              alignment: Alignment.centerLeft,
//              child: Center(child: AutoSizeText("${books[indexs]}", maxLines: 2, maxFontSize: 18,)),
//            ), 
//         ],
//       ),
      
//     ),
//   );
// }