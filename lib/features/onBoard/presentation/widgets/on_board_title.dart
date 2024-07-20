import 'package:flutter/material.dart';

class OnBoardTitle extends StatelessWidget {
  final String text;
  const OnBoardTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }
}
