
import 'package:ingo/core/models/arabic.dart';
import 'package:ingo/core/models/english.dart';
import 'package:ingo/core/models/language.dart';

class SupportedLanguages {
  static List<Language> get locales =>  [
          ArabicLanguage(),
          EnglishLanguage()
      ];
}
