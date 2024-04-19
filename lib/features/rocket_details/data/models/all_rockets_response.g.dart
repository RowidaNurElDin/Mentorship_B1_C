// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_rockets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllRocketsResponseImpl _$$AllRocketsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AllRocketsResponseImpl(
      height: json['height'] == null
          ? null
          : Diameter.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : Diameter.fromJson(json['diameter'] as Map<String, dynamic>),
      mass: json['mass'] == null
          ? null
          : Mass.fromJson(json['mass'] as Map<String, dynamic>),
      firstStage: json['firstStage'] == null
          ? null
          : FirstStage.fromJson(json['firstStage'] as Map<String, dynamic>),
      secondStage: json['secondStage'] == null
          ? null
          : SecondStage.fromJson(json['secondStage'] as Map<String, dynamic>),
      engines: json['engines'] == null
          ? null
          : Engines.fromJson(json['engines'] as Map<String, dynamic>),
      landingLegs: json['landingLegs'] == null
          ? null
          : LandingLegs.fromJson(json['landingLegs'] as Map<String, dynamic>),
      payloadWeights: (json['payloadWeights'] as List<dynamic>?)
          ?.map((e) => PayloadWeights.fromJson(e as Map<String, dynamic>))
          .toList(),
      flickrImages: (json['flickrImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      active: json['active'] as bool?,
      stages: json['stages'] as int?,
      boosters: json['boosters'] as int?,
      costPerLaunch: json['costPerLaunch'] as int?,
      successRatePct: json['successRatePct'] as int?,
      firstFlight: json['firstFlight'] as String?,
      country: json['country'] as String?,
      company: json['company'] as String?,
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$AllRocketsResponseImplToJson(
        _$AllRocketsResponseImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'diameter': instance.diameter,
      'mass': instance.mass,
      'firstStage': instance.firstStage,
      'secondStage': instance.secondStage,
      'engines': instance.engines,
      'landingLegs': instance.landingLegs,
      'payloadWeights': instance.payloadWeights,
      'flickrImages': instance.flickrImages,
      'name': instance.name,
      'type': instance.type,
      'active': instance.active,
      'stages': instance.stages,
      'boosters': instance.boosters,
      'costPerLaunch': instance.costPerLaunch,
      'successRatePct': instance.successRatePct,
      'firstFlight': instance.firstFlight,
      'country': instance.country,
      'company': instance.company,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
    };

_$HeightImpl _$$HeightImplFromJson(Map<String, dynamic> json) => _$HeightImpl(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: json['feet'] as int?,
    );

Map<String, dynamic> _$$HeightImplToJson(_$HeightImpl instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

_$DiameterImpl _$$DiameterImplFromJson(Map<String, dynamic> json) =>
    _$DiameterImpl(
      meters: (json['meters'] as num?)?.toDouble(),
      feet: (json['feet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DiameterImplToJson(_$DiameterImpl instance) =>
    <String, dynamic>{
      'meters': instance.meters,
      'feet': instance.feet,
    };

_$MassImpl _$$MassImplFromJson(Map<String, dynamic> json) => _$MassImpl(
      kg: json['kg'] as int?,
      lb: json['lb'] as int?,
    );

Map<String, dynamic> _$$MassImplToJson(_$MassImpl instance) =>
    <String, dynamic>{
      'kg': instance.kg,
      'lb': instance.lb,
    };

_$ThrustSeaLevelImpl _$$ThrustSeaLevelImplFromJson(Map<String, dynamic> json) =>
    _$ThrustSeaLevelImpl(
      kN: json['kN'] as int?,
      lbf: json['lbf'] as int?,
    );

Map<String, dynamic> _$$ThrustSeaLevelImplToJson(
        _$ThrustSeaLevelImpl instance) =>
    <String, dynamic>{
      'kN': instance.kN,
      'lbf': instance.lbf,
    };

_$PayloadsImpl _$$PayloadsImplFromJson(Map<String, dynamic> json) =>
    _$PayloadsImpl(
      compositeFairing: json['compositeFairing'] == null
          ? null
          : CompositeFairing.fromJson(
              json['compositeFairing'] as Map<String, dynamic>),
      option1: json['option1'] as String?,
    );

Map<String, dynamic> _$$PayloadsImplToJson(_$PayloadsImpl instance) =>
    <String, dynamic>{
      'compositeFairing': instance.compositeFairing,
      'option1': instance.option1,
    };

_$CompositeFairingImpl _$$CompositeFairingImplFromJson(
        Map<String, dynamic> json) =>
    _$CompositeFairingImpl(
      height: json['height'] == null
          ? null
          : Diameter.fromJson(json['height'] as Map<String, dynamic>),
      diameter: json['diameter'] == null
          ? null
          : Diameter.fromJson(json['diameter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompositeFairingImplToJson(
        _$CompositeFairingImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'diameter': instance.diameter,
    };

_$IspImpl _$$IspImplFromJson(Map<String, dynamic> json) => _$IspImpl(
      seaLevel: json['seaLevel'] as int?,
      vacuum: json['vacuum'] as int?,
    );

Map<String, dynamic> _$$IspImplToJson(_$IspImpl instance) => <String, dynamic>{
      'seaLevel': instance.seaLevel,
      'vacuum': instance.vacuum,
    };

_$LandingLegsImpl _$$LandingLegsImplFromJson(Map<String, dynamic> json) =>
    _$LandingLegsImpl(
      number: json['number'] as int?,
      material: json['material'],
    );

Map<String, dynamic> _$$LandingLegsImplToJson(_$LandingLegsImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'material': instance.material,
    };

_$PayloadWeightsImpl _$$PayloadWeightsImplFromJson(Map<String, dynamic> json) =>
    _$PayloadWeightsImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      kg: json['kg'] as int?,
      lb: json['lb'] as int?,
    );

Map<String, dynamic> _$$PayloadWeightsImplToJson(
        _$PayloadWeightsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kg': instance.kg,
      'lb': instance.lb,
    };
