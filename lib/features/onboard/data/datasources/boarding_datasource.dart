import '../../../../core/networking/api_consumer.dart';
import '../../../../core/networking/endpoints.dart';

abstract class BoardingDataSource {
  Future getBoarding();
}

class BoardingDataSourceImpl implements BoardingDataSource {
  final ApiConsumer _apiConsumer;

  BoardingDataSourceImpl(this._apiConsumer);

  @override
  Future getBoarding() async {
    final response = await _apiConsumer.getData(url: EndPoints.launches);
    return response.data;
  }
}
