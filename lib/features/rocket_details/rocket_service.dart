import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:mentoship_rockets_discovries_project/features/rocket_details/rocket_provider.dart';

import '../../core/error/exceptions.dart';
import 'data/models/all_rockets_response.dart';

class RocketService {
  RocketService({
    required this.rocketProvider,
  });

  /// [RocketProvider] is responsible for handling the API calls from the remote data source
  final RocketProvider rocketProvider;

  Future<List<AllRocketsResponse>?> getRockets() async {
    try {
      final response = await rocketProvider.getRockets();
      return response;
    } catch (e) {
      if (e is DioException) {
        throw ServerException(message: e.response?.data['message'] ?? '');
      } else {
        rethrow;
      }
    }
  }

  Future<AllRocketsResponse?> getRocket({required final String id}) async {
    try {
      final response = await rocketProvider.getRocket(id);
      return response;
    } catch (e) {
      if (e is DioException) {
        throw ServerException(message: e.response?.data['message'] ?? '');
      } else {
        rethrow;
      }
    }
  }
}
