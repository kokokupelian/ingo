import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingo/features/onBoard/presentation/bloc/on_board_bloc.dart';
import 'package:ingo/features/onBoard/presentation/pages/on-board_language_screen.dart';
import 'package:ingo/features/onBoard/presentation/pages/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardBloc, OnBoardState>(
      listener: (context, state) {
        if (state is OnBoardLanguageState) {
          print('language');
          Navigator.pushAndRemoveUntil(
            context,
            OnBoardScreen.route(),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            OnBoardLanguageScreen.route(),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Stack(
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
                      context
                          .read<OnBoardBloc>()
                          .add(OnBoardGetLanguageEvent());
                    },
                  )
                  .fade()
                  .scale(),
            ),
          ],
        ),
      ),
    );
  }
}
