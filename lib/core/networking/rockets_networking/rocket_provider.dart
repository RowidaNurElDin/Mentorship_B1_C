import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../features/rocket_details/data/models/all_rockets_response.dart';

part 'rocket_provider.g.dart';

/// This abstract class is the interface that is used to communicate with the server and get the data.

@RestApi()
abstract class RocketProvider {
  factory RocketProvider(final Dio dio, {final String baseUrl}) =
      _RocketProvider;

  @GET('/rockets')
  Future<List<AllRocketsResponse>> getRockets();

  @GET('/rockets/{id}')
  Future<AllRocketsResponse> getRocket(@Path('id') final String id);
}
