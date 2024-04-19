import '../../domain/entities/boarding_item.dart';
import '../../domain/repositories/boarding_repository.dart';
import '../datasources/boarding_datasource.dart';

class BoardingRepositoryImpl implements BoardingRepository {
  final BoardingDataSource _boardingDataSource;

  BoardingRepositoryImpl(this._boardingDataSource);

  @override
  Future getBoarding() async =>
      await _boardingDataSource.getBoarding();
}
