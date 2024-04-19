import 'package:dartz/dartz.dart';
import '../../../networking/errors/failure.dart';

abstract class ThemeRepository {
  Future<Either<Failure, bool>> changeTheme({required String themeMode});
  Future<Either<Failure, String>> getSaved();
}
