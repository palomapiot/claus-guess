import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class ChristmasWords {
  List<String> _words = [];

  Future readWords() async {
    final fileText = await rootBundle.loadString('res/words.txt');
    _words = fileText.split('\n');
  }

  String getWord() {
    return _words[Random().nextInt(_words.length)];
  }
}
