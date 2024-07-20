import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ingo/core/errors/failure.dart';

abstract interface class OnBoardRepository {
  Either<Failure, bool> isLoggedIn();
  Future<Either<Failure, bool>> logIn();
  Future<Either<Failure, bool>> saveLanguage(String locale);
  Either<Failure, Locale> getLanguage();
}
