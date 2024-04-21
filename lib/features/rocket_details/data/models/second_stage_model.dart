import 'package:freezed_annotation/freezed_annotation.dart';

import 'all_rockets_response.dart';

part 'second_stage_model.freezed.dart';
part 'second_stage_model.g.dart';

@freezed
class SecondStage with _$SecondStage {
  factory SecondStage({
    ThrustSeaLevel? thrust,
    Payloads? payloads,
    bool? reusable,
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
  }) = _SecondStage;

  factory SecondStage.fromJson(Map<String, dynamic> json) => _$SecondStageFromJson(json);


}
