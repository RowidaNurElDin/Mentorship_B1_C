import 'package:dartz/dartz.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/api_constants.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/api_service.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/dio_factory.dart';

import '../../../../core/helpers/failure_helpers/failure_handler.dart';
import '../models/all_rockets_response.dart';

class GetAllRocketsRepository{
  GetAllRocketsRepository();

  Future<Either<Failure, List<AllRocketsResponse>?>> getAllRockets() async {
    return ApiService.callMethod< List<AllRocketsResponse>?>(() async {
        await DioFactory.dio!.get(ApiConstants.apiBaseUrl+ApiConstants.getAllRocketsEndPoint)
        .then((value){
          if(value.statusCode==200){
    
              return (value.data as List).map((e) => AllRocketsResponse.fromJson(e)).toList();
          }
          else{
            return Failure(message: value.data['message']);
          }
        });
    });
  }
}