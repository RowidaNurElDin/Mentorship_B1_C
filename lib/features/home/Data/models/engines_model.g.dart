// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Engines _$EnginesFromJson(Map<String, dynamic> json) => Engines(
      isp: json['isp'] == null
          ? null
          : Isp.fromJson(json['isp'] as Map<String, dynamic>),
      thrustSeaLevel: json['thrustSeaLevel'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrustSeaLevel'] as Map<String, dynamic>),
      thrustVacuum: json['thrustVacuum'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrustVacuum'] as Map<String, dynamic>),
      number: json['number'] as int?,
      type: json['type'] as String?,
      version: json['version'] as String?,
      layout: json['layout'] as String?,
      engineLossMax: json['engineLossMax'] as int?,
      propellant1: json['propellant1'] as String?,
      propellant2: json['propellant2'] as String?,
      thrustToWeight: json['thrustToWeight'] as int?,
    );

Map<String, dynamic> _$EnginesToJson(Engines instance) => <String, dynamic>{
      'isp': instance.isp,
      'thrustSeaLevel': instance.thrustSeaLevel,
      'thrustVacuum': instance.thrustVacuum,
      'number': instance.number,
      'type': instance.type,
      'version': instance.version,
      'layout': instance.layout,
      'engineLossMax': instance.engineLossMax,
      'propellant1': instance.propellant1,
      'propellant2': instance.propellant2,
      'thrustToWeight': instance.thrustToWeight,
    };
