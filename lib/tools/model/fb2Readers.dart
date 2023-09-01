/********************************************/
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-07-30                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************
import 'dart:io';
import 'package:xml/xml.dart';

// Future<String> readFb2File(File file) async {
//   try {
//     // Read the fb2 file
//     String content = await file.readAsString();

//     // Parse the fb2 content
//     XmlDocument xmlDocument = XmlDocument.parse(content);
//     List<XmlNode> bodyNodes = xmlDocument.findAllElements('body').toList();

//     List<String> texts = [];
//     for (var bodyNode in bodyNodes) {
//       String text = bodyNode.text.trim(); // Trim the text to remove leading/trailing whitespaces
//       if (text.isNotEmpty) {
//         texts.add(text);
//       }
//     }

//     return texts.join('\n\n'); // Return the whole text as a single string with non-empty lines
//   } catch (e) {
//     print("Error reading or parsing the fb2 file: $e");
//     return ''; // Return an empty string in case of an error
//   }
// }

Future<String> readFb2File(File file) async {
  try {
    // Read the fb2 file
    String content = await file.readAsString();

    // Parse the fb2 content
    XmlDocument xmlDocument = XmlDocument.parse(content);
    List<XmlNode> descriptionNodes = xmlDocument.findAllElements('description').toList();

    String author = '';
    String title = '';
    for (var descriptionNode in descriptionNodes) {
      var authorNode = descriptionNode.findElements('author').firstOrNull;
      if (authorNode != null) {
        author = authorNode.text.trim();
      }
      var titleNode = descriptionNode.findElements('title-info').firstOrNull?.findElements('book-title').firstOrNull;
      if (titleNode != null) {
        title = titleNode.text.trim();
      }
      if (author.isNotEmpty && title.isNotEmpty) {
        break;
      }
    }

    List<XmlNode> bodyNodes = xmlDocument.findAllElements('body').toList();

    List<String> texts = [];
    for (var bodyNode in bodyNodes) {
      String text = bodyNode.text.trim(); // Trim the text to remove leading/trailing whitespaces
      if (text.isNotEmpty) {
        texts.add(text);
      }
    }

    String mainText = texts.join('\n\n');
    mainText = mainText.replaceAll(RegExp(r'\n{3,}'), '\n\n'); // Replace consecutive empty lines with a single empty line

    return '$author\n$title\n\n$mainText'; // Return author and title in one line, followed by the whole text
  } catch (e) {
    print("Error reading or parsing the fb2 file: $e");
    return ''; // Return an empty string in case of an error
  }
}
