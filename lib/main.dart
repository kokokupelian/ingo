import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ingo/core/app_localizations.dart';
import 'package:ingo/core/app_status_navigation_bar.dart';
import 'package:ingo/core/color_palette.dart';
import 'package:ingo/core/constants/supported_languages.dart';
import 'package:ingo/core/models/language.dart';
import 'package:ingo/features/onBoard/presentation/bloc/on_board_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingo/features/onBoard/presentation/pages/splash_screen.dart';
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Language? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardBloc, OnBoardState>(
      listener: (context, state) {
        if (state is OnBoardLanguageState) {
          setState(() {
            _selectedLanguage = state.language;
          });
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent , systemNavigationBarColor: Colors.transparent),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Cairo',
            scaffoldBackgroundColor: ColorPalette.echoColorWhite,
          ),
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: SupportedLanguages.locales.map(
            (e) => e.locale,
          ),
          locale: _selectedLanguage?.locale,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
