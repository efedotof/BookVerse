import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/Button/ButtonRegistration.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/HeadingText.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/LabelText.dart';
import 'package:readerabooks/HomeScreen/Home.dart';
import 'package:readerabooks/ThemeMyApp/localization.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context);
     return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,leading: IconButton(
    icon: Icon(Icons.chevron_left), // Замените "new_icon" на иконку, которую вы хотите использовать
    onPressed: () {
      Navigator.pop(context);
    },
  ),),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: [
              Container(
                child: Column(
                  children: [
                     Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Lottie.asset(
                    'assets/lottie/loaded.json',
                    fit: BoxFit.fill,
                  ),
                ),
                    SizedBox(height: 10,),
                    HeadingText(text: appLocalizations.translate('registration')!),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                          child: LabelText(
                              text:
                                   appLocalizations.translate('descriptionOnRegistration')!),
                    ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width / 1.12,
                child: Column(
                  children: [
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()), //Имя
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()), //Фамилия
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()),  //Отчество
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()),  //Дата рождения
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()),  //Почта
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()),  //Пароль
                    Container(height: 40, width: MediaQuery.of(context).size.width / 1.3,child: TextField()), //Подтверждение пароля
                    SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: ButtonRegistration(text:  appLocalizations.translate("ContinueOnRegistration")!, onPressed: (){

                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );


                      }),),
                      SizedBox(height: 10,)
                  ],
                ),
              ),        
            ],
          ),
        ),
      ),
    );
  }
}