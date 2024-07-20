import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ingo/core/errors/failure.dart';
import 'package:ingo/core/usecases/usecase.dart';
import 'package:ingo/core/utils/locale_string_functions.dart';
import 'package:ingo/features/onBoard/domain/repositories/on_board_repository.dart';

class SaveLanguage implements UseCase<bool, Locale> {
  OnBoardRepository onBoardRepository;
  SaveLanguage({required this.onBoardRepository});

  @override
  Future<Either<Failure, bool>> call(Locale params) {
    return onBoardRepository
        .saveLanguage(LocaleStringFunctions.toStringUniform(params));
  }
}
