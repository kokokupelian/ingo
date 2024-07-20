import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ingo/core/errors/failure.dart';
import 'package:ingo/core/usecases/usecase.dart';
import 'package:ingo/features/onBoard/domain/repositories/on_board_repository.dart';

class GetLanguage implements UseCaseStatic<Locale, NoParams> {
  final OnBoardRepository onBoardRepository;
  GetLanguage({required this.onBoardRepository});

  @override
  Either<Failure, Locale> call(NoParams params) {
    return onBoardRepository.getLanguage();
  }
}
