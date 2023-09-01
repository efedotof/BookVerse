import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// Future<String> readMobiFile(context,File file) async {
//   try {
//     final fileData = await DefaultAssetBundle.of(context).load(file.path);
//     final tempDir = await getTemporaryDirectory();
//     final tempFile = File('${tempDir.path}/temp.mobi');
//     await tempFile.writeAsBytes(fileData.buffer.asUint8List());

//     final book = mobi.MobiFile.fromFile(tempFile);
//     final StringBuffer textBuffer = StringBuffer();

//     for (final record in book.records) {
//       if (record is mobi.TextRecord) {
//         textBuffer.write(record.text);
//       }
//     }

//     return textBuffer.toString();
//   } catch (e) {
//     print("Error reading MOBI file: $e");
//     return '';
//   }
// }
Future<String> readMobiFile(File file) async {;
  if (!file.existsSync()) {
    return ''; // Файл не существует
  }

  final fileBytes = file.readAsBytesSync();
  
  // Некоторые байты для идентификации MOBI формата
  const mobiIdentifier = [0x4D, 0x4F, 0x42, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

  if (fileBytes.length < mobiIdentifier.length) {
    return ''; // Недостаточная длина файла для MOBI
  }

  for (int i = 0; i < mobiIdentifier.length; i++) {
    if (fileBytes[i] != mobiIdentifier[i]) {
      return ''; // Не соответствует идентификатору MOBI
    }
  }
  final offsetBytes = fileBytes.sublist(0x14, 0x18);
  final offset = offsetBytes[0] | (offsetBytes[1] << 8) | (offsetBytes[2] << 16) | (offsetBytes[3] << 24);
  final textBytes = fileBytes.sublist(offset);
  final text = utf8.decode(textBytes);

  return text;
}
