import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';

abstract class LocaleRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSaved();
}
