// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecondStageImpl _$$SecondStageImplFromJson(Map<String, dynamic> json) =>
    _$SecondStageImpl(
      thrust: json['thrust'] == null
          ? null
          : ThrustSeaLevel.fromJson(json['thrust'] as Map<String, dynamic>),
      payloads: json['payloads'] == null
          ? null
          : Payloads.fromJson(json['payloads'] as Map<String, dynamic>),
      reusable: json['reusable'] as bool?,
      engines: json['engines'] as int?,
      fuelAmountTons: (json['fuelAmountTons'] as num?)?.toDouble(),
      burnTimeSec: json['burnTimeSec'] as int?,
    );

Map<String, dynamic> _$$SecondStageImplToJson(_$SecondStageImpl instance) =>
    <String, dynamic>{
      'thrust': instance.thrust,
      'payloads': instance.payloads,
      'reusable': instance.reusable,
      'engines': instance.engines,
      'fuelAmountTons': instance.fuelAmountTons,
      'burnTimeSec': instance.burnTimeSec,
    };
