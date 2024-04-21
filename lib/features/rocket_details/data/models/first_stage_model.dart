import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'all_rockets_response.dart';

part 'first_stage_model.freezed.dart';
part 'first_stage_model.g.dart';

@freezed
class FirstStage with _$FirstStage {
  factory FirstStage({
    ThrustSeaLevel? thrustSeaLevel,
    ThrustSeaLevel? thrustVacuum,
    bool? reusable,
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
  }) = _FirstStage;

  factory FirstStage.fromJson(Map<String, dynamic> json) => _$FirstStageFromJson(json);

  // factory FirstStage.placeholder() => FirstStage(
  //   thrustSeaLevel: ThrustSeaLevel.placeholder(),
  //   thrustVacuum: ThrustSeaLevel.placeholder(),
  //   reusable: false,
  //   engines: 0,
  //   fuelAmountTons: 0.0,
  //   burnTimeSec: 0,
  // );
}
