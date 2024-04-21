
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentoship_rockets_discovries_project/features/rocket_details/data/models/second_stage_model.dart';

import 'engines_model.dart';
import 'first_stage_model.dart';


part 'all_rockets_response.freezed.dart';
part 'all_rockets_response.g.dart';

@freezed
class AllRocketsResponse with _$AllRocketsResponse {

  const factory AllRocketsResponse({
    Diameter? height,
    Diameter? diameter,
    Mass? mass,
    FirstStage? firstStage,
    SecondStage? secondStage,
    Engines? engines,
    LandingLegs? landingLegs,
    List<PayloadWeights>? payloadWeights,
    List<String>? flickrImages,
    String? name,
    String? type,
    bool? active,
    int? stages,
    int? boosters,
    int? costPerLaunch,
    int? successRatePct,
    String? firstFlight,
    String? country,
    String? company,
    String? wikipedia,
    String? description,
    String? id,
  }) = _AllRocketsResponse;

  factory AllRocketsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllRocketsResponseFromJson(json);

}

@freezed
class Height with _$Height {
  factory Height({
    double? meters,
    int? feet,
  }) = _Height;

  factory Height.fromJson(Map<String, dynamic> json) => _$HeightFromJson(json);
}

@freezed
class Diameter with _$Diameter {
  factory Diameter({
    double? meters,
    double? feet,
  }) = _Diameter;

  factory Diameter.fromJson(Map<String, dynamic> json) => _$DiameterFromJson(json);
}

@freezed
class Mass with _$Mass {
  factory Mass({
    int? kg,
    int? lb,
  }) = _Mass;

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);
}

@freezed
class ThrustSeaLevel with _$ThrustSeaLevel {
  factory ThrustSeaLevel({
    int? kN,
    int? lbf,
  }) = _ThrustSeaLevel;

  factory ThrustSeaLevel.fromJson(Map<String, dynamic> json) => _$ThrustSeaLevelFromJson(json);
}

@freezed
class Payloads with _$Payloads {
  factory Payloads({
    CompositeFairing? compositeFairing,
    String? option1,
  }) = _Payloads;

  factory Payloads.fromJson(Map<String, dynamic> json) => _$PayloadsFromJson(json);
}

@freezed
class CompositeFairing with _$CompositeFairing {
  factory CompositeFairing({
    Diameter? height,
    Diameter? diameter,
  }) = _CompositeFairing;

  factory CompositeFairing.fromJson(Map<String, dynamic> json) => _$CompositeFairingFromJson(json);
}

@freezed
class Isp with _$Isp {
  factory Isp({
    int? seaLevel,
    int? vacuum,
  }) = _Isp;

  factory Isp.fromJson(Map<String, dynamic> json) => _$IspFromJson(json);
}

@freezed
class LandingLegs with _$LandingLegs {
  factory LandingLegs({
    int? number,
    dynamic material,
  }) = _LandingLegs;

  factory LandingLegs.fromJson(Map<String, dynamic> json) => _$LandingLegsFromJson(json);
}

@freezed
class PayloadWeights with _$PayloadWeights {
  factory PayloadWeights({
    String? id,
    String? name,
    int? kg,
    int? lb,
  }) = _PayloadWeights;

  factory PayloadWeights.fromJson(Map<String, dynamic> json) => _$PayloadWeightsFromJson(json);
}
