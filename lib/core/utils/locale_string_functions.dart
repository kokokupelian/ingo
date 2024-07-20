import 'package:flutter/material.dart';

class LocaleStringFunctions {
  static String toStringUniform(Locale locale) {
    return "${locale.languageCode}-${locale.countryCode}";
  }

  static Locale toLocale(String value) {
    var split = value.split('-');
    return Locale(split[0], split[1]);
  }
}
