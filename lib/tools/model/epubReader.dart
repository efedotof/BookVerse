import 'dart:convert';
import 'dart:io';

Future<String> readEpubFile(File file) async {
  String fullText = '';

  try {
    List<int> bytes = await file.readAsBytes();

    String content = String.fromCharCodes(bytes);

    // Примерный способ разделения страниц:
    List<String> pages = content.split('\n\n'); // Предполагаем, что страницы разделены двойным переносом строки

    // Проходимся по страницам и добавляем текст к fullText
    for (String page in pages) {
      // Здесь вы можете дополнительно обрабатывать текст, удалять теги, спецсимволы и т.д.
      fullText += page + '\n';
      fullText = utf8.decode(fullText as List<int>); // Добавляем перенос строки между страницами
    }

  } catch (e) {
    print("Error reading EPUB file: $e");
  }

  return fullText;
}
