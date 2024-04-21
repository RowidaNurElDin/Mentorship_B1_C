
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:mentoship_rockets_discovries_project/core/dependency_injection/dependency_injection.dart';
// import 'package:mentoship_rockets_discovries_project/core/helpers/failure_helpers/failure_handler.dart';
//
// class ApiService {
//   static Future<Either<Failure, T>> callMethod<T>(Function fun) async {
//     final networkInfo = getIt<InternetConnectionChecker>();
//     if (await networkInfo.hasConnection) {
//       try {
//         T response = await fun.call();
//         return right(response);
//       } on DioException catch (e) {
//         return left(DioErrorFailure(message: e.message));
//       }
//     } else {
//       return left( const OfflineFailure(message: "Please check your connection"));
//     }
//   }
// }
