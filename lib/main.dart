import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ingo/core/app_localizations.dart';
import 'package:ingo/core/app_status_navigation_bar.dart';
import 'package:ingo/core/color_palette.dart';
import 'package:ingo/core/constants/supported_languages.dart';
import 'package:ingo/features/onBoard/presentation/bloc/on_board_bloc.dart';
import 'package:ingo/features/onBoard/presentation/pages/on_board_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingo/init_dependencies.main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppStatusNavigationBar().changeColor(ColorPalette.echoColorWhite);
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<OnBoardBloc>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardBloc, OnBoardState, OnBoardLanguageState>(
      selector: (state) {
        return state is OnBoardLanguageState;
      },
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Cairo'),
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: context.read<OnBoardBloc>().,
          supportedLocales: SupportedLanguages.locales,
          home: const OnBoardScreen(),
        );
      },
    );
  }
}
