import 'package:claus_guess/views/home.dart';
import 'package:claus_guess/views/word_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GuessView extends StatefulWidget {
  const GuessView({required this.wordList});

  final List<String> wordList;

  @override
  GuessViewState createState() => GuessViewState();
}

class GuessViewState extends State<GuessView> {
  String alphabet = 'abcdefghijklmnopqrstuvwxyz';

  String word = 'christmas'; // TODO: pick one from the list of words
  int opportunities = 6;
  int clausState = 0;
  int guessedLetters = 0;
  String progress = '_ _ _ _ _ _ _ _ '; // TODO: calculate from the word
  List<bool> buttonStatus = List.generate(26, (index) {
    return true;
  });
  bool finishedGame = false;
  bool resetGame = false;

  void newGame() {
    setState(() {
      alphabet = 'abcdefghijklmnopqrstuvwxyz';
      word = 'christmas'; // TODO: pick one from the list of words
      opportunities = 6;
      guessedLetters = 0;
      progress = '_ _ _ _ _ _ _ _ '; // TODO: calculate from the word
      buttonStatus = List.generate(26, (index) {
        return true;
      });
      finishedGame = false;
      resetGame = false;
    });
  }

  Widget createButton(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 6),
      child: Center(
        child: WordButton(
          buttonTitle: alphabet[index].toUpperCase(),
          onPress: buttonStatus[index] ? () => wordPress(index) : null,
        ),
      ),
    );
  }

  void returnHomePage() {
    Navigator.of(context).push<Route>(
      MaterialPageRoute(
        builder: (context) {
          return const HomeView();
        },
      ),
    );
  }


  void wordPress(int index) {
    if (opportunities == 0) {
      returnHomePage();
    }

    if (finishedGame) {
      setState(() {
        resetGame = true;
      });
      return;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6, 8, 6, 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(top: 0.5),
                                      child: IconButton(
                                        tooltip: 'Lives',
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        iconSize: 39,
                                        icon: const Icon(MdiIcons.heart),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      padding:
                                      const EdgeInsets.fromLTRB(8.7, 7.9, 0, 0.8),
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 38,
                                        width: 38,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text(
                                              opportunities.toString(),
                                              style: const TextStyle(
                                                color: Color(0xFFb11e31),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Robobo',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: FittedBox(
                            child: Image.asset(
                              'img/$clausState.png',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 35),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              progress,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 2, 8, 10),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  //columnWidths: {1: FlexColumnWidth(10)},
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: createButton(0),
                      ),
                      TableCell(
                        child: createButton(1),
                      ),
                      TableCell(
                        child: createButton(2),
                      ),
                      TableCell(
                        child: createButton(3),
                      ),
                      TableCell(
                        child: createButton(4),
                      ),
                      TableCell(
                        child: createButton(5),
                      ),
                      TableCell(
                        child: createButton(6),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(7),
                      ),
                      TableCell(
                        child: createButton(8),
                      ),
                      TableCell(
                        child: createButton(9),
                      ),
                      TableCell(
                        child: createButton(10),
                      ),
                      TableCell(
                        child: createButton(11),
                      ),
                      TableCell(
                        child: createButton(12),
                      ),
                      TableCell(
                        child: createButton(13),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(14),
                      ),
                      TableCell(
                        child: createButton(15),
                      ),
                      TableCell(
                        child: createButton(16),
                      ),
                      TableCell(
                        child: createButton(17),
                      ),
                      TableCell(
                        child: createButton(18),
                      ),
                      TableCell(
                        child: createButton(19),
                      ),
                      TableCell(
                        child: createButton(20),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: createButton(21),
                      ),
                      TableCell(
                        child: createButton(22),
                      ),
                      TableCell(
                        child: createButton(23),
                      ),
                      TableCell(
                        child: createButton(24),
                      ),
                      TableCell(
                        child: createButton(25),
                      ),
                      const TableCell(
                        child: Text(''),
                      ),
                      const TableCell(
                        child: Text(''),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
