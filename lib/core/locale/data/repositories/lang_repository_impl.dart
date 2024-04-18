import 'package:dartz/dartz.dart';
import '../../../errors/exceptions.dart';
import '../../../errors/failure.dart';
import '../../domain/repositories/lang_repository.dart';
import '../datasources/lang_local_datasource.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final LocaleLocalDataSource localeLocalDataSource;
  LocaleRepositoryImpl({
    required this.localeLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final saved = await localeLocalDataSource.changeLang(langCode: langCode);

      return Right(saved);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSaved() async {
    try {
      final langLocal = await localeLocalDataSource.getSavedLang();

      return Right(langLocal);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
}
