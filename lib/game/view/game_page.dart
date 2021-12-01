import 'package:claus_guess/game/view/game_form.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: GamePage());

  @override
  Widget build(BuildContext context) {
    return const GameForm();
  }
}
