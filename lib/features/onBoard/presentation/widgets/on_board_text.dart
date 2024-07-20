import 'package:flutter/material.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_description.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_title.dart';

class OnBoardText extends StatelessWidget {
  final Duration animationDuration;
  final String title, description;
  const OnBoardText(
      {super.key,
      required this.animationDuration,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          key: Key(title),
          padding: const EdgeInsets.all(15),
          child: Center(
            child: OnBoardTitle(title),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: OnBoardDescription(description),
          ),
        ),
      ],
    );
  }
}
