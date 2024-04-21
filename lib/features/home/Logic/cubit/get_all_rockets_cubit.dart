
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/models/all_rockets_response.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/remote_data_source/get_all_rockets_data_source.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Logic/cubit/get_all_rockets_state.dart';

import '../../../../core/helpers/failure_helpers/failure_handler.dart';

class GetAllRocketsCubit extends Cubit<GetAllRocketsState> {
  final GetAllRocketsRepository getAllRocketsRepository ;
  GetAllRocketsCubit(this.getAllRocketsRepository) : super(const GetAllRocketsState.initial());

  Future<void> getAllRockets() async {
    final result = await getAllRocketsRepository.getAllRockets();
    result.fold(
      (l) =>  emit(state.copyWith(
        state: GetRocketsState.error,
        failure: l,
      )),
     (r) => emit(
      state.copyWith(
       state: GetRocketsState.success,
       allRockets: r??[]

     )));
  }
}
