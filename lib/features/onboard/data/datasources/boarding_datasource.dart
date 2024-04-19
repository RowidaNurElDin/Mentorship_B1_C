import 'package:mentoship_rockets_discovries_project/features/onboard/data/models/rockets_model.dart';

import '../../../../core/networking/api_consumer.dart';
import '../../../../core/networking/endpoints.dart';

abstract class BoardingDataSource {
  Future<List<RocketsModel>> getBoarding();
}

class BoardingDataSourceImpl implements BoardingDataSource {
  final ApiConsumer _apiConsumer;

  BoardingDataSourceImpl(this._apiConsumer);

  @override
  Future<List<RocketsModel>> getBoarding() async {
    final response = await _apiConsumer.getData(url: EndPoints.rockets);
    return response.data;
  }
}
