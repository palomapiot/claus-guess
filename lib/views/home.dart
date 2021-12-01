import 'package:claus_guess/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                    'img/claus-transparent.png',
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
                                    return const GamePage();
                                    /*return const GuessView(
                                    wordList: [
                                      'christmas', 'claus', 'tree'
                                    ],
                                  );*/
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
