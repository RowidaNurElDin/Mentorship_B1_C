import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'all_rockets_response.dart';

part 'engines_model.freezed.dart';
part 'engines_model.g.dart';

@freezed
class Engines with _$Engines {
  factory Engines({
    Isp? isp,
    ThrustSeaLevel? thrustSeaLevel,
    ThrustSeaLevel? thrustVacuum,
    int? number,
    String? type,
    String? version,
    String? layout,
    int? engineLossMax,
    String? propellant1,
    String? propellant2,
    int? thrustToWeight,
  }) = _Engines;

  factory Engines.fromJson(Map<String, dynamic> json) => _$EnginesFromJson(json);

}
