import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/Button/ButtonLogin.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/Button/ButtonRegistration.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/HeadingText.dart';
import 'package:readerabooks/Definingpage/AdditionScreens/LabelText.dart';
import 'package:readerabooks/LoginScreen/Login.dart';
import 'package:readerabooks/Registration/Registration.dart';
import 'package:readerabooks/ThemeMyApp/localization.dart';

class DefiningPage extends StatefulWidget {
  const DefiningPage({super.key});

  @override
  State<DefiningPage> createState() => _DefiningPageState();
}

class _DefiningPageState extends State<DefiningPage> {
  @override
  Widget build(BuildContext context) {
     final AppLocalizations appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),

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
                  SizedBox(height: 20,),
                  HeadingText(text: appLocalizations.translate("letsgetstarted")??""),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                        child: LabelText(
                            text:
                               appLocalizations.translate("descriptiononDevine")??"" )),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 1.12,
                    child: ButtonRegistration(
                        text:  appLocalizations.translate('createaccount')??"", onPressed: (){ Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registration()),
            );})),
                SizedBox(height: 20,),
                Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 1.12,
                child: ButtonLogin(text:  appLocalizations.translate('login')??"", onPressed: (){
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
                })),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}



/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/