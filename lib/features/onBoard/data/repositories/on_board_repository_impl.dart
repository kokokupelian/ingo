import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:ingo/core/errors/exceptions.dart';
import 'package:ingo/core/errors/failure.dart';
import 'package:ingo/core/utils/locale_string_functions.dart';
import 'package:ingo/features/onBoard/data/datasource/on_board_datasource.dart';
import 'package:ingo/features/onBoard/domain/repositories/on_board_repository.dart';

class OnBoardRepositoryImpl implements OnBoardRepository {
  final OnBoardDatasource onBoardDatasource;
  OnBoardRepositoryImpl({required this.onBoardDatasource});

  @override
  Either<Failure, bool> isLoggedIn() {
    try {
      var value = onBoardDatasource.isLoggedIn();
      return right(value);
    } on SharedPreferencesException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> logIn() async {
    try {
      var value = await onBoardDatasource.logIn();
      return right(value);
    } on SharedPreferencesException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> saveLanguage(String locale) async {
    try {
      var value = await onBoardDatasource.saveLanguage(locale);
      return right(value);
    } on SharedPreferencesException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Either<Failure, Locale> getLanguage() {
    try {
      var value = onBoardDatasource.getLanguage();
      if (value.isEmpty) {
        return left(Failure('Language Not Selected'));
      } else {
        return right(LocaleStringFunctions.toLocale(value));
      }
    } on SharedPreferencesException catch (e) {
      return left(Failure(e.message));
    }
  }
}
