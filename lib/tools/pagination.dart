List<String> splitText(String text, double fontSize, double screenWidth, double screenHeight) {
  List<String> pages = []; // Список для хранения разбитых частей текста

  int startIndex = 0; // Индекс начала текущей страницы
  int endIndex = 0; // Индекс конца текущей страницы

  // Максимальное количество символов на странице, которое можно поместить в указанном размере шрифта
  int maxCharactersPerPage = ((screenWidth ~/ fontSize) * (screenHeight ~/ fontSize)).truncate();

  // Пока текст не закончен, продолжаем разбивать на страницы
  while (startIndex < text.length) {
    // Устанавливаем конец текущей страницы
    endIndex = startIndex + maxCharactersPerPage;

    // Если конец текущей страницы находится за пределами текста, устанавливаем endIndex в конец текста
    if (endIndex > text.length) {
      endIndex = text.length;
    }

    // Проверяем, чтобы слова не прерывались
    if (endIndex < text.length && !text.substring(endIndex, endIndex + 1).contains(RegExp(r'\s'))) {
      // Если текущий символ не пробел, перемещаем endIndex влево, пока не найдем пробел
      while (endIndex > startIndex && !text.substring(endIndex - 1, endIndex).contains(RegExp(r'\s'))) {
        endIndex--;
      }
    }

    // Добавляем текущую страницу в список
    pages.add(text.substring(startIndex, endIndex));

    // Обновляем начальный индекс для следующей страницы
    startIndex = endIndex;
  }

  return pages;
}