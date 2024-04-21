// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstStage _$FirstStageFromJson(Map<String, dynamic> json) => FirstStage(
      thrustSeaLevel: json['thrustSeaLevel'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrustSeaLevel'] as Map<String, dynamic>),
      thrustVacuum: json['thrustVacuum'] == null
          ? null
          : ThrustSeaLevel.fromJson(
              json['thrustVacuum'] as Map<String, dynamic>),
      reusable: json['reusable'] as bool?,
      engines: json['engines'] as int?,
      fuelAmountTons: (json['fuelAmountTons'] as num?)?.toDouble(),
      burnTimeSec: json['burnTimeSec'] as int?,
    );

Map<String, dynamic> _$FirstStageToJson(FirstStage instance) =>
    <String, dynamic>{
      'thrustSeaLevel': instance.thrustSeaLevel,
      'thrustVacuum': instance.thrustVacuum,
      'reusable': instance.reusable,
      'engines': instance.engines,
      'fuelAmountTons': instance.fuelAmountTons,
      'burnTimeSec': instance.burnTimeSec,
    };
