
import 'package:mentoship_rockets_discovries_project/features/home/Data/models/all_rockets_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'first_stage_model.g.dart';

@JsonSerializable()
class FirstStage {
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

  FirstStage(
      {this.thrustSeaLevel,
      this.thrustVacuum,
      this.reusable,
      this.engines,
      this.fuelAmountTons,
      this.burnTimeSec});

  Map<String, dynamic> toJson() => _$FirstStageToJson(this);
  factory FirstStage.fromJson(Map<String, dynamic> json) => _$FirstStageFromJson(json);
  }