import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class OnBoardImage extends StatelessWidget {
  final Duration animationDuration;
  final String backgroundAsset, foregroundAsset;
  const OnBoardImage(
      {super.key,
      required this.animationDuration,
      required this.backgroundAsset,
      required this.foregroundAsset});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: animationDuration,
            child: SizedBox.expand(
              child: SvgPicture.asset(
                backgroundAsset,
                key: Key(backgroundAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: animationDuration,
          child: Lottie.asset(foregroundAsset, key: Key(foregroundAsset)),
        )
      ],
    );
  }
}
