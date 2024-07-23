import 'package:flutter/material.dart';
import 'package:ingo/core/app_localizations.dart';
import 'package:ingo/features/onBoard/presentation/widgets/on_board_button.dart';

class OnBoardLoginPage extends StatelessWidget {
  const OnBoardLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OnBoardButton(
              onPressed: () {},
              text: AppLocalizations.of(context)
                  .translate('create_a_new_account')),
          OnBoardWhiteButton(
              onPressed: () {},
              text: AppLocalizations.of(context).translate('login_with')),
          OnboardTextButton(
              onPressed: () {},
              text: AppLocalizations.of(context)
                  .translate('try_the_app_as_a_guest'))
        ],
      ),
    );
  }
}
