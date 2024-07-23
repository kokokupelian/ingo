import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ingo/core/models/arabic.dart';
import 'package:ingo/core/models/english.dart';
import 'package:ingo/core/models/language.dart';
import 'package:ingo/features/onBoard/presentation/bloc/on_board_bloc.dart';
import 'package:ingo/features/onBoard/presentation/consts/language_assets.dart';
import 'package:ingo/features/onBoard/presentation/pages/on_board_screen.dart';
import 'package:ingo/features/onBoard/presentation/widgets/language_button.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardLanguageScreen extends StatelessWidget {
  static route() => PageTransition(
      child: const OnBoardLanguageScreen(),
      type: PageTransitionType.rightToLeft);
  const OnBoardLanguageScreen({super.key});

  _chooseLanguage(BuildContext context,{required Language language}) {
      context.read<OnBoardBloc>().add(
                          OnBoardSaveLanguageEvent(language: language),
                        );
      Navigator.pushAndRemoveUntil(context, OnBoardScreen.route(), (route) => false,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/png/onBoardWhite.png',
              fit: BoxFit.cover,
            ),
          ),
          SvgPicture.asset('assets/images/svg/onBoarding/logoColored.svg'),
          Flexible(
              child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'اختر لغة التطبيق',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'يمكنك تغيير هذا الاختيار لاحقاً من الإعدادات',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                child: LanguageButton(
                  backgroundImageAsset:
                      LanguageAssets.assets['en']!['background']!,
                  trailingIconAsset: LanguageAssets.assets['en']!['trailing']!,
                  leadingText: LanguageAssets.assets['en']!['text']!,
                  onTap: () {
                    _chooseLanguage(context, language: EnglishLanguage());
                  },
                ),
              ),
              Expanded(
                child: LanguageButton(
                  backgroundImageAsset:
                      LanguageAssets.assets['ar']!['background']!,
                  trailingIconAsset: LanguageAssets.assets['ar']!['trailing']!,
                  leadingText: LanguageAssets.assets['ar']!['text']!,
                  onTap: () {
                    _chooseLanguage(context, language: ArabicLanguage());
                  },
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
