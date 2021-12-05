import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class ChristmasWords {
  List<String> _words = [];

  Future readWords({String? fileName = 'res/words_en.txt'}) async {
    final fileText = await rootBundle.loadString(fileName!);
    _words = fileText.split('\n');
  }

  String getWord() {
    return _words[Random().nextInt(_words.length)];
  }
}
