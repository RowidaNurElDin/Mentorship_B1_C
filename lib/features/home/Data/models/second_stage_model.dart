  
  
import 'package:mentoship_rockets_discovries_project/features/home/Data/models/all_rockets_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'second_stage_model.g.dart';

 @JsonSerializable()
  class SecondStage {
  ThrustSeaLevel? thrust;
  Payloads? payloads;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

  SecondStage(
      {this.thrust,
      this.payloads,
      this.reusable,
      this.engines,
      this.fuelAmountTons,
      this.burnTimeSec});

  Map<String, dynamic> toJson() => _$SecondStageToJson(this);
  factory SecondStage.fromJson(Map<String, dynamic> json) => _$SecondStageFromJson(json);
}