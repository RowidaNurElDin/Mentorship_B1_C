import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/rockets_networking/rocket_provider.dart';

import '../../../features/rocket_details/data/models/all_rockets_response.dart';
import '../../error/exceptions.dart';
import '../../helpers/failure_helpers/failure_handler.dart';



class RocketService {
  RocketService({
    required this.rocketProvider,
  });

  /// [RocketProvider] is responsible for handling the API calls from the remote data source
  final RocketProvider rocketProvider;

  Future<Either<Failure, List<AllRocketsResponse>?>> getRockets() async {

    try {
      final response = await rocketProvider.getRockets();
      return right(response);

    } catch (e) {
      return left(Failure(message: e.toString()));
      // if (e is DioException) {
      //   throw ServerException(message: e.response?.data['message'] ?? '');
      // } else {
      //   rethrow;
      // }
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
