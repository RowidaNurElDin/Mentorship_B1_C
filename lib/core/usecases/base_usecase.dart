import 'package:dartz/dartz.dart';
import '../networking/errors/failure.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
