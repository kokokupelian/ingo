import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingo/features/onBoard/presentation/pages/on-board_language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/images/svg/onBoarding/splashBackground.svg',
          ),
        ),
        Center(
          child: SvgPicture.asset('assets/images/svg/onBoarding/logo.svg')
              .animate(
                onComplete: (controller) {
                  Future.delayed(Duration(seconds: 2)).then((value) =>
                      Navigator.pushReplacement(
                          context, OnBoardLanguageScreen.route()));
                },
              )
              .fade()
              .scale(),
        ),
      ],
    );
  }
}
