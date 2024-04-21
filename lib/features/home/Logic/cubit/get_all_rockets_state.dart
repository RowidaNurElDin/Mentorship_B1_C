import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/models/all_rockets_response.dart';

import '../../../../core/helpers/failure_helpers/failure_handler.dart';

part 'get_all_rockets_state.freezed.dart';

@freezed
class GetAllRocketsState<T> with _$GetAllRocketsState<T> {
  const factory GetAllRocketsState.initial({
    @Default(GetRocketsState.loading)GetRocketsState state,
    @Default([])List<AllRocketsResponse> allRockets,
    Failure? failure,
  }) = _Initial;
}

enum GetRocketsState{
  loading,
  success,
  error
}
