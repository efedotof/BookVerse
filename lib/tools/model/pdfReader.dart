import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

Future<String> readPdfFile(File file) async {
  // final pdf = PdfDocument.openFile(file.path);
  // final StringBuffer textBuffer = StringBuffer();

  // for (int pageNum = 0; pageNum < pdf.pagesCount; pageNum++) {
  //   final PdfPage page = pdf.getPage(pageNum);

  //   final List<PdfTextBlock> textBlocks = await page.getTextBlocks();
  //   for (var textBlock in textBlocks) {
  //     for (var line in textBlock.lines) {
  //       for (var span in line.spans) {
  //         textBuffer.write(span.text);
  //       }
  //       textBuffer.write('\n');
  //     }
  //   }
  // }

  // return textBuffer.toString();
   String fullText = '';
try {
  List<String> textList = await ReadPdfText.getPDFtextPaginated(file.path);
  fullText = textList.join(' '); // Объединяем все строки в одну строку
} on PlatformException {
  print('Failed to get PDF text.');
}
return fullText;

}