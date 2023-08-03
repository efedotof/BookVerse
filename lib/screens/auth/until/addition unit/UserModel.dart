/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-08-04                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************
class UserModel{
  String? uid;
  String? email;
  String? name;
  String? nickname;

  UserModel({this.uid, this.email, this.name, this.nickname});

  factory UserModel.fromMap(map){
    return UserModel(uid: map['uid'],email: map['email'], name: map['name'], nickname: map['nickname']);
  }

  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'name':name,
      'nickname':nickname,
    };
  }



}