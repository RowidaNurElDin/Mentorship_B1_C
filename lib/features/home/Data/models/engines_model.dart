import 'package:mentoship_rockets_discovries_project/features/home/Data/models/all_rockets_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'engines_model.g.dart';

@JsonSerializable()
class Engines {
  Isp? isp;
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  int? thrustToWeight;

  Engines(
      {this.isp,
      this.thrustSeaLevel,
      this.thrustVacuum,
      this.number,
      this.type,
      this.version,
      this.layout,
      this.engineLossMax,
      this.propellant1,
      this.propellant2,
      this.thrustToWeight});

  Map<String, dynamic> toJson() => _$EnginesToJson(this);
  factory Engines.fromJson(Map<String, dynamic> json) => _$EnginesFromJson(json);
}