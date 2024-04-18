import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../cache/cache_consumer.dart';
import '../cache/cache_keys.dart';

class AppInterceptors extends Interceptor {
  final CacheConsumer _cacheConsumer;
  Map<String, dynamic> headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
  };

  AppInterceptors(this._cacheConsumer);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers = headers;
    print({
      'Accept-Language':
          _cacheConsumer.getData(key: CacheKeys.locale, defaultValue: 'ar'),
      'Authorization':
          'Bearer ${_cacheConsumer.getData<String?>(key: CacheKeys.token, defaultValue: null)}'
    });
    options.headers.addAll({
      'accept': '*/*',
      'Accept-Language':
          _cacheConsumer.getData(key: CacheKeys.locale, defaultValue: 'en') ==
                  'ar'
              ? 'Arabic'
              : 'English',
      'Authorization':
          'Bearer ${_cacheConsumer.getData<String?>(key: CacheKeys.token, defaultValue: null)}'
      // 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJhYmM0ZmVmZS1kYzJlLTQzMTQtYTlmMC0yNWVkNTI4ZjM1YTAiLCJpZCI6ImQ5Y2Q3NjRjLTI2N2UtNDdkYS05N2ZlLWRlOWM5NzdiMDkxOCIsImlhdCI6MTcxMDA3NDg0NCwiZXhwIjoxNzEwNjc0ODQ0fQ.dhWUKUgKSsRlrJCqvpRBQhzzAX41bWU99pR2YDhqbFM'

      // 'Accept-Language':
      //     _cacheConsumer.getData(key: CacheKeys.locale, defaultValue: 'ar')
    });
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
  //  @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     print(
//         'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
//     return super.onError(err, handler);
//   }
}
