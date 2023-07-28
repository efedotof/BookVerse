import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class cards_recs extends StatelessWidget {
  const cards_recs({super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;


  @override
  Widget build(BuildContext context) {
    return Container(
                        width: 150,
                        height: 400,
                        decoration: BoxDecoration(
                      ),
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Center(child: Text("Текущее")),
                              ), 
                              Container(
                                height: 200 - 16,
                                width: 150,
                                child: IconButton(
                                      onPressed: (){
                                        null;
                                      },
                                      icon: Image.network('${image}', fit: BoxFit.fill,),
                                    ),
                              ),
                              // if(extractedChildren.length == 2) extractedChildren[1],
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Center(child: AutoSizeText("${name}", maxLines: 2, maxFontSize: 18,)),
                              ), 
                            ],
                          ),
                          
                        ),
                      );
  }
}

class cards_todo extends StatelessWidget{
  const cards_todo({super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
                        width: 150,
                        height: 400,
                        decoration: BoxDecoration(
                      ),
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Center(child: Text("Недавнее")),
                              ), 
                              Container(
                                height: 200 - 16,
                                width: 150,
                                child: IconButton(
                                      onPressed: (){
                                        null;
                                      },
                                      icon: Image.network('${image}', fit: BoxFit.fill,),
                                    ),
                              ),
                              // if(extractedChildren.length == 2) extractedChildren[1],
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Center(child: AutoSizeText("${name}", maxLines: 2, maxFontSize: 18,)),
                              ), 
                            ],
                          ),
                          
                        ),
                      );
  }
}
// class cards_rel extends StatelessWidget{
  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
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
//   }
// }


class cards_todo_list extends StatelessWidget {
  const cards_todo_list({super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;

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
                },
                icon: Image.network('$image', fit: BoxFit.fill,),
              ),
          ),
          Container(
             padding: EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: Center(child: AutoSizeText("${name}", maxLines: 2, maxFontSize: 18,)),
           ), 
        ],
      ),
      
    ),
  );
  }
}