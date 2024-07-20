import 'package:fpdart/fpdart.dart';
import 'package:ingo/core/errors/failure.dart';
import 'package:ingo/core/usecases/usecase.dart';
import 'package:ingo/features/onBoard/domain/repositories/on_board_repository.dart';

class LogIn implements UseCase<bool, NoParams> {
  OnBoardRepository onBoardRepository;
  LogIn({required this.onBoardRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return onBoardRepository.logIn();
  }
}
