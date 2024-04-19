import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../../../core/usecases/no_param.dart';
import '../repositories/boarding_repository.dart';

class GetBoardingUsecase extends BaseUseCase<dynamic, NoParams> {
  final BoardingRepository _boardingRepository;

  GetBoardingUsecase(this._boardingRepository);
  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    try {
      final boardingItems = await _boardingRepository.getBoarding();
      return Right(boardingItems);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
