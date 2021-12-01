import 'package:flutter/material.dart';

class WordButton extends StatelessWidget {
  const WordButton({required this.buttonTitle, required this.onPress});

  final VoidCallback? onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFb11e31),),
      child: Text(
        buttonTitle,
        textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)
      ),
    );
  }
}
