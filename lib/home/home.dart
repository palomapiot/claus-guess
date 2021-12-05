import 'package:claus_guess/common/christmas_words.dart';
import 'package:claus_guess/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final ChristmasWords words = ChristmasWords();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String theme = 'Santa Claus (EN)';
  String fileName = 'res/words_en.txt';
  List<String> themeOptions = [
    'Santa Claus (EN)',
    'Apalpador (GL)',
    'Reyes Magos (ES)'
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    widget.words.readWords(fileName: fileName);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 8, 6, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      DropdownButton(
                        value: theme,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        underline: null,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String? newValue) {
                          setState(() {
                            theme = newValue!;
                            switch (theme) {
                              case 'Santa Claus (EN)':
                                fileName = 'res/words_en.txt';
                                break;
                              case 'Apalpador (GL)':
                                fileName = 'res/words_gl.txt';
                                break;
                              case 'Reyes Magos (ES)':
                                fileName = 'res/words_es.txt';
                                break;
                            }
                            widget.words.readWords(
                              fileName: fileName,
                            );
                          });
                        },
                        items: themeOptions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 1, 8, 8),
                    child: const Text(
                      'XMAS GUESS GAME',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'PWHappyChristmas',
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                      theme == 'Santa Claus (EN)'
                          ? 'img/santa.png'
                          : theme == 'Apalpador (GL)'
                              ? 'img/apalpador.png'
                              : 'img/rey.png',
                      height: height * 0.40,
                    ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push<Route>(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return GamePage(
                                      words: widget.words,
                                    );
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFb11e31),
                            ),
                            child: const Text(
                              'Start',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
