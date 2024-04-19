import 'package:mentoship_rockets_discovries_project/features/home/Data/models/engines_model.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/models/first_stage_model.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/models/second_stage_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_rockets_response.g.dart';
@JsonSerializable()
class AllRocketsResponse{
  Diameter? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<PayloadWeights>? payloadWeights;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  AllRocketsResponse(
      {this.height,
      this.diameter,
      this.mass,
      this.firstStage,
      this.secondStage,
      this.engines,
      this.landingLegs,
      this.payloadWeights,
      this.flickrImages,
      this.name,
      this.type,
      this.active,
      this.stages,
      this.boosters,
      this.costPerLaunch,
      this.successRatePct,
      this.firstFlight,
      this.country,
      this.company,
      this.wikipedia,
      this.description,
      this.id});

   Map<String, dynamic> toJson() => _$AllRocketsResponseToJson(this);

  factory AllRocketsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllRocketsResponseFromJson(json);

  
}


@JsonSerializable()
class Height {
  double? meters;
  int? feet;

  Height({this.meters, this.feet});

  Map<String, dynamic> toJson() => _$HeightToJson(this);

  factory Height.fromJson(Map<String, dynamic> json) =>
      _$HeightFromJson(json);


}

@JsonSerializable()
class Diameter {
  double? meters;
  double? feet;

  Diameter({this.meters, this.feet});

  Map<String,dynamic> toJson() => _$DiameterToJson(this);

  factory Diameter.fromJson(Map<String, dynamic> json) => _$DiameterFromJson(json);
}

@JsonSerializable()
class Mass {
  int? kg;
  int? lb;

  Mass({this.kg, this.lb});

  Map<String,dynamic> toJson() => _$MassToJson(this);
  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);
}
@JsonSerializable()
class ThrustSeaLevel {
int? kN;
int? lbf;

ThrustSeaLevel({this.kN, this.lbf});
Map<String,dynamic> toJson() => _$ThrustSeaLevelToJson(this);
factory ThrustSeaLevel.fromJson(Map<String,dynamic> json)=> _$ThrustSeaLevelFromJson(json);
}



@JsonSerializable()
class Payloads {
  CompositeFairing? compositeFairing;
  String? option1;

  Payloads({this.compositeFairing, this.option1});
  Map<String,dynamic> toJson() => _$PayloadsToJson(this);
  factory Payloads.fromJson(Map<String,dynamic> json)=> _$PayloadsFromJson(json);

}

@JsonSerializable()
class CompositeFairing {
  Diameter? height;
  Diameter? diameter;

  CompositeFairing({this.height, this.diameter});
  Map<String,dynamic> toJson() => _$CompositeFairingToJson(this);
  factory CompositeFairing.fromJson(Map<String,dynamic> json)=> _$CompositeFairingFromJson(json);

}

@JsonSerializable()
class Isp {
  int? seaLevel;
  int? vacuum;

  Isp({this.seaLevel, this.vacuum});
  Map<String,dynamic> toJson() => _$IspToJson(this);
  factory Isp.fromJson(Map<String,dynamic> json)=> _$IspFromJson(json);
}

@JsonSerializable()
class LandingLegs {
  int? number;
  var material;

  LandingLegs({this.number, this.material});
  Map<String,dynamic> toJson() => _$LandingLegsToJson(this);
  factory LandingLegs.fromJson(Map<String,dynamic> json)=> _$LandingLegsFromJson(json);
}

@JsonSerializable()
class PayloadWeights {
  String? id;
  String? name;
  int? kg;
  int? lb;

  PayloadWeights({this.id, this.name, this.kg, this.lb});
  Map<String,dynamic> toJson() => _$PayloadWeightsToJson(this);
  factory PayloadWeights.fromJson(Map<String,dynamic> json)=> _$PayloadWeightsFromJson(json);

}