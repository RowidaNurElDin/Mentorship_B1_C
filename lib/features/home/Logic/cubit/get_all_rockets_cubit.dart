
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/remote_data_source/get_all_rockets_data_source.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Logic/cubit/get_all_rockets_state.dart';

import '../../../../core/networking/rockets_networking/rocket_service.dart';
import '../../Data/models/all_rockets_response.dart';


class GetAllRocketsCubit extends Cubit<GetAllRocketsState> {
  final GetAllRocketsRepository getAllRocketsRepository ;
  final RocketService rocketService;

  GetAllRocketsCubit(this.getAllRocketsRepository, this.rocketService) : super(const GetAllRocketsState.initial());

  Future<void> getAllRockets() async {
    final result = await rocketService.getRockets();
    result.fold(
      (l) =>  emit(state.copyWith(
        state: GetRocketsState.error,
        failure: l,
      )),
     (r) => emit(
      state.copyWith(
       state: GetRocketsState.success,
       allRockets: r as List<AllRocketsResponse>??[]

     )));
  }
}
