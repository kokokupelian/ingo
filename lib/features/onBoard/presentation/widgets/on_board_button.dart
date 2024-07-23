import 'package:flutter/material.dart';
import 'package:ingo/core/color_palette.dart';

class OnBoardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const OnBoardButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primaryColor50,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        elevation: 5,
        shadowColor: ColorPalette.primaryColor50
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}

class OnBoardWhiteButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const OnBoardWhiteButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primaryColor05,
        padding: const EdgeInsets.symmetric(horizontal: 50),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorPalette.primaryColor50),
      ),
    );
  }
}

class OnboardTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const OnboardTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorPalette.primaryColor50),
      ),
    );
  }
}
