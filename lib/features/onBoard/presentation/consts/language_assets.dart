class LanguageAssets {
  static String get _assetsPath => 'assets/images/png/onBoarding';

  static Map<String, Map<String, String>> assets = {
    'ar': {
      'background': '$_assetsPath/languageBackgroundAR.png',
      'trailing': '$_assetsPath/arabic.png',
      'text': 'العربية'
    },
    'en': {
      'background': '$_assetsPath/languageBackgroundEN.png',
      'trailing': '$_assetsPath/english.png',
      'text': 'English'
    }
  };
}
