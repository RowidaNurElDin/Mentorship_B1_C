import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../cache/cache_consumer.dart';
import '../cache/cache_keys.dart';
import '../errors/exceptions.dart';
import 'api_consumer.dart';
import 'app_interceptor.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;
  final CacheConsumer cacheConsumer;
  final AppInterceptors appInterceptors;
  late CancelToken cancelToken;

  DioConsumer(
      {required this.dio,
      required this.cacheConsumer,
      required this.appInterceptors,
      required String baseUrl}) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio.interceptors.add(appInterceptors);

    if (kDebugMode) {}
  }

  @override
  Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    String? token = cacheConsumer.getData<String?>(
        key: CacheKeys.token, defaultValue: null);

    try {
      final response = await dio.get(
        url,
        queryParameters: query,
      );

      return response;
    } on DioException catch (e) {
      print(e);
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
  }) async {
    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: data,
      );

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    String? token = cacheConsumer.getData<String?>(
        key: CacheKeys.token, defaultValue: null);
    if (token != null) {
      final json = {'access-token': token};
      if (query == null) {
        query = json;
      } else {
        query.addAll(json);
      }
    }
    try {
      cancelToken = CancelToken();

      final response = await dio.put(url,
          queryParameters: query, data: data, cancelToken: cancelToken);
      if (response.statusCode != 200) {
        throw ServerException(response.data['message']);
      }
      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> patchData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.patch(url, data: data, queryParameters: query);

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      cancelToken = CancelToken();

      final response =
          await dio.delete(url, data: data, cancelToken: cancelToken);

      return response;
    } on DioException catch (e) {
      throw _handelDioError(e)!;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  dynamic _handelDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.cancel:
        throw const ServerException('Cancel');
      case DioExceptionType.unknown:
        throw NotFoundException(error.response!.data['message']);

        throw NoInternetConnectionException();
      default:
        return throw NotFoundException(error.response!.data['message']);
    }
  }

  @override
  void cancelRequest() {
    if (cancelToken.isCancelled) {
      return;
    }
    cancelToken.cancel();
  }
}
