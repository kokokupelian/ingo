import 'package:fpdart/fpdart.dart';
import 'package:ingo/core/errors/failure.dart';
import 'package:ingo/core/usecases/usecase.dart';
import 'package:ingo/features/onBoard/domain/repositories/on_board_repository.dart';

class IsLoggedIn implements UseCaseStatic<bool, NoParams> {
  OnBoardRepository onBoardRepository;
  IsLoggedIn({required this.onBoardRepository});

  @override
  Either<Failure, bool> call(NoParams params) {
    return onBoardRepository.isLoggedIn();
  }
}
