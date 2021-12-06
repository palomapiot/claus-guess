import 'package:claus_guess/common/christmas_words.dart';
import 'package:claus_guess/common/widgets/word_button.dart';
import 'package:claus_guess/game/cubit/game_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class GameForm extends StatelessWidget {
  const GameForm({Key? key, required this.words, this.theme = ''})
      : super(key: key);

  final ChristmasWords words;
  final String theme;

  Widget createButton(int index, BuildContext context) {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 6),
      child: Center(
        child: WordButton(
          buttonTitle: alphabet[index].toUpperCase(),
          onPress: context.read<GameCubit>().isActive(index)
              ? () {
                  context.read<GameCubit>().letterPressed(
                        alphabet[index].toUpperCase(),
                        index,
                      );
                }
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        if (context.read<GameCubit>().hasWon()) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Dialogs.materialDialog(
              msg: 'The word was ${state.word}',
              title: 'Yay! You won, congrats! :)',
              lottieBuilder: Lottie.asset(
                'img/trophy.json',
                fit: BoxFit.contain,
                repeat: true,
              ),
              color: Colors.white,
              context: context,
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Play again',
                  iconData: Icons.play_arrow_rounded,
                  color: const Color(0xFFb11e31),
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            ).then((dynamic value) {
              context.read<GameCubit>().newGame(words.getWord());
            });
          });
        } else if (context.read<GameCubit>().hasLost()) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Dialogs.materialDialog(
              msg: 'The word was ${state.word}',
              title: 'Oh no! You didnt guess the word :(',
              lottieBuilder: Lottie.asset(
                'img/lost-santa-claus.json',
                fit: BoxFit.contain,
              ),
              color: Colors.white,
              context: context,
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Play again',
                  iconData: Icons.play_arrow_rounded,
                  color: const Color(0xFFb11e31),
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            ).then((dynamic value) {
              context.read<GameCubit>().newGame(words.getWord());
            });
          });
        }
        return SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: BlocBuilder<GameCubit, GameState>(
                  builder: (context, state) {
                    return Column(
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
                                        padding:
                                            const EdgeInsets.only(top: 0.5),
                                        child: IconButton(
                                          tooltip: 'Back',
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          iconSize: 45,
                                          icon: const Icon(
                                            Icons.arrow_back_rounded,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            const EdgeInsets.only(top: 0.5),
                                        child: IconButton(
                                          tooltip: 'Lives',
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          iconSize: 45,
                                          icon: const Icon(MdiIcons.heart),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                          8.7,
                                          7.9,
                                          0,
                                          0.8,
                                        ),
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          height: 43,
                                          width: 44,
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Text(
                                                state.remainingOpportunities
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Color(0xFFb11e31),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'PatrickHand',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              'img/${state.lostOpportunities}$theme.png',
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
                                state.progress,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 40,
                                  letterSpacing: 7,
                                  color: Colors.white,
                                  fontFamily: 'PatrickHand',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 2, 8, 10),
                child: BlocBuilder<GameCubit, GameState>(
                  buildWhen: (previous, current) =>
                      current.uncoveredLetters != previous.uncoveredLetters ||
                      current.remainingOpportunities !=
                          previous.remainingOpportunities,
                  builder: (context, state) {
                    return Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: createButton(0, context),
                            ),
                            TableCell(
                              child: createButton(1, context),
                            ),
                            TableCell(
                              child: createButton(2, context),
                            ),
                            TableCell(
                              child: createButton(3, context),
                            ),
                            TableCell(
                              child: createButton(4, context),
                            ),
                            TableCell(
                              child: createButton(5, context),
                            ),
                            TableCell(
                              child: createButton(6, context),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: createButton(7, context),
                            ),
                            TableCell(
                              child: createButton(8, context),
                            ),
                            TableCell(
                              child: createButton(9, context),
                            ),
                            TableCell(
                              child: createButton(10, context),
                            ),
                            TableCell(
                              child: createButton(11, context),
                            ),
                            TableCell(
                              child: createButton(12, context),
                            ),
                            TableCell(
                              child: createButton(13, context),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: createButton(14, context),
                            ),
                            TableCell(
                              child: createButton(15, context),
                            ),
                            TableCell(
                              child: createButton(16, context),
                            ),
                            TableCell(
                              child: createButton(17, context),
                            ),
                            TableCell(
                              child: createButton(18, context),
                            ),
                            TableCell(
                              child: createButton(19, context),
                            ),
                            TableCell(
                              child: createButton(20, context),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: createButton(21, context),
                            ),
                            TableCell(
                              child: createButton(22, context),
                            ),
                            TableCell(
                              child: createButton(23, context),
                            ),
                            TableCell(
                              child: createButton(24, context),
                            ),
                            TableCell(
                              child: createButton(25, context),
                            ),
                            const TableCell(
                              child: Text(''),
                            ),
                            const TableCell(
                              child: Text(''),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
