import 'package:flutter/material.dart';

class Language{
  late Locale locale;

  Language({required this.locale});

  @override
  String toString() {
    return "${locale.languageCode}-${locale.countryCode}";
  }

  Locale toLocale(String localeString){
    var split = localeString.split('-');
    return Locale(split[0], split[1]);
  }
}