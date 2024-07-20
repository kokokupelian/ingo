import 'package:fpdart/fpdart.dart';
import 'package:ingo/core/errors/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UseCaseStatic<SuccessType, Params> {
  Either<Failure, SuccessType> call(Params params);
}

class NoParams {}
