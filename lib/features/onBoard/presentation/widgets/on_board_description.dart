import 'package:flutter/material.dart';

class OnBoardDescription extends StatelessWidget {
  final String text;
  const OnBoardDescription(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}
