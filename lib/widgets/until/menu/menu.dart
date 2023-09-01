import 'package:flutter/material.dart';
import 'package:magazine/screens/home.dart';
import 'package:magazine/screens/list_page/list_page3.dart';
import 'package:magazine/widgets/until/AuthUntil/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'buttonsMenu.dart';


class MenuShow extends StatefulWidget {
  const MenuShow(
      {super.key,
      required this.image,
      required this.name_person,
      required this.email,
      required this.mode});

  final String image;
  final String name_person;
  final String email;
  final bool mode;

  @override
  State<MenuShow> createState() => _MenuShowState();
}

class _MenuShowState extends State<MenuShow> {
  bool ColorsMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  
  void colorModes(){
    Home.of(context)!.ColorsMode();
    print(Home.of(context)!.modes);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black54,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, // затемнение экрана
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: GestureDetector(
              onTap: () {
                search_page.of(context)!.showMenuState();
              },
            )),
            Container(
              
              decoration: BoxDecoration(
                  color: widget.mode?Colors.black:Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          radius: MediaQuery.of(context).size.height * 0.04,
                          child: ClipOval(
                              child: widget.image != ''
                                  ? Image.network(
                                      widget.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      color: Colors.blueAccent,
                                    )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name_person,
                              style: TextStyle(
                                color: widget.mode?Colors.white:Colors.black,
                                fontWeight: FontWeight.w500, // Жирный шрифт
                                fontSize: 21, // Размер текста
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              widget.email,
                              style: TextStyle(
                                color: widget.mode?Colors.white:Colors.black,
                                fontWeight: FontWeight.w300, // Жирный шрифт
                                fontSize: 18, // Размер текста
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtosMenu(
                    icons: Icons.settings,
                    text: 'Настройки профиля',
                    actions: null,
                    mode: widget.mode
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ButtosMenu(
                  //   icons: ColorsMode
                  //       ? Icons.dark_mode_outlined
                  //       : Icons.light_mode,
                  //   text: ColorsMode ? "Светлый режим" : 'Темный режим',
                  //   actions: colorModes,
                  // ),
                   Container(
                    
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: TextButton(onPressed: () {
        Home.of(context)!.ColorsMode();
      },
      child: Row(
        children: [
          const SizedBox(width: 50,),
          Icon(widget.mode
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode, color: Colors.grey.shade600,),
          const SizedBox(width: 10,),
          Text(widget.mode ? "Светлый режим" : 'Темный режим', style: TextStyle(fontWeight: FontWeight.w300,color: widget.mode?Colors.white:Colors.grey.shade900,),)
        ],
      )),
    ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtosMenu(
                    icons: Icons.build_circle_outlined,
                    text: 'О приложении',
                    actions: null,
                    mode: widget.mode
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtosMenu(
                    icons: Icons.help_outline,
                    text: 'Помошь',
                    actions: null,
                    mode: widget.mode
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtosMenu(
                    icons: Icons.logout_outlined,
                    text: 'Выйти',
                    actions: Auth().signOut(),
                    mode: widget.mode
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
