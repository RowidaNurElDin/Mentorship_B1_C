import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/helpers/failure_helpers/failure_handler.dart';
import '../../Data/models/all_rockets_response.dart';
// import '../../../rocket_details/data/models/all_rockets_response.dart';

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
