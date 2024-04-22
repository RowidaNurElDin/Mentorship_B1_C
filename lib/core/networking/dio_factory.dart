import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory{
  DioFactory._();

  static Dio? dio;

  static Dio getDio(){
    Duration timeOut = const Duration(seconds: 30);
    if(dio == null){
      dio = Dio();
      dio!..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut
      ..options.baseUrl = ApiConstants.apiBaseUrl;
      addDioInterceptor();
    }
    return dio!;
  }

  static void addDioInterceptor(){
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true
      )
    );
  }


}