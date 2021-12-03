import 'package:claus_guess/common/christmas_words.dart';
import 'package:claus_guess/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final ChristmasWords christmasWords = ChristmasWords();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    widget.christmasWords.readWords();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 38,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 1, 8, 8),
                    child: const Text(
                      'CLAUS GUESS GAME',
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
                    'img/claus.png',
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
                                      words: widget.christmasWords,
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