import 'package:claus_guess/common/christmas_words.dart';
import 'package:claus_guess/game/cubit/game_cubit.dart';
import 'package:claus_guess/game/view/game_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key, required this.words}) : super(key: key);

  final ChristmasWords words;

  Page page() => MaterialPage<void>(child: GamePage(words: words));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => GameCubit()..newGame(words.getWord()),
          child: GameForm(
            words: words,
          ),
        ),
      ),
    );
  }
}
