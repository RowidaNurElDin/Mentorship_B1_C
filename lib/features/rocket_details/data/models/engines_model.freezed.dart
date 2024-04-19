// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'engines_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Engines _$EnginesFromJson(Map<String, dynamic> json) {
  return _Engines.fromJson(json);
}

/// @nodoc
mixin _$Engines {
  Isp? get isp => throw _privateConstructorUsedError;
  ThrustSeaLevel? get thrustSeaLevel => throw _privateConstructorUsedError;
  ThrustSeaLevel? get thrustVacuum => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get layout => throw _privateConstructorUsedError;
  int? get engineLossMax => throw _privateConstructorUsedError;
  String? get propellant1 => throw _privateConstructorUsedError;
  String? get propellant2 => throw _privateConstructorUsedError;
  int? get thrustToWeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnginesCopyWith<Engines> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnginesCopyWith<$Res> {
  factory $EnginesCopyWith(Engines value, $Res Function(Engines) then) =
      _$EnginesCopyWithImpl<$Res, Engines>;
  @useResult
  $Res call(
      {Isp? isp,
      ThrustSeaLevel? thrustSeaLevel,
      ThrustSeaLevel? thrustVacuum,
      int? number,
      String? type,
      String? version,
      String? layout,
      int? engineLossMax,
      String? propellant1,
      String? propellant2,
      int? thrustToWeight});

  $IspCopyWith<$Res>? get isp;
  $ThrustSeaLevelCopyWith<$Res>? get thrustSeaLevel;
  $ThrustSeaLevelCopyWith<$Res>? get thrustVacuum;
}

/// @nodoc
class _$EnginesCopyWithImpl<$Res, $Val extends Engines>
    implements $EnginesCopyWith<$Res> {
  _$EnginesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isp = freezed,
    Object? thrustSeaLevel = freezed,
    Object? thrustVacuum = freezed,
    Object? number = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? layout = freezed,
    Object? engineLossMax = freezed,
    Object? propellant1 = freezed,
    Object? propellant2 = freezed,
    Object? thrustToWeight = freezed,
  }) {
    return _then(_value.copyWith(
      isp: freezed == isp
          ? _value.isp
          : isp // ignore: cast_nullable_to_non_nullable
              as Isp?,
      thrustSeaLevel: freezed == thrustSeaLevel
          ? _value.thrustSeaLevel
          : thrustSeaLevel // ignore: cast_nullable_to_non_nullable
              as ThrustSeaLevel?,
      thrustVacuum: freezed == thrustVacuum
          ? _value.thrustVacuum
          : thrustVacuum // ignore: cast_nullable_to_non_nullable
              as ThrustSeaLevel?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String?,
      engineLossMax: freezed == engineLossMax
          ? _value.engineLossMax
          : engineLossMax // ignore: cast_nullable_to_non_nullable
              as int?,
      propellant1: freezed == propellant1
          ? _value.propellant1
          : propellant1 // ignore: cast_nullable_to_non_nullable
              as String?,
      propellant2: freezed == propellant2
          ? _value.propellant2
          : propellant2 // ignore: cast_nullable_to_non_nullable
              as String?,
      thrustToWeight: freezed == thrustToWeight
          ? _value.thrustToWeight
          : thrustToWeight // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IspCopyWith<$Res>? get isp {
    if (_value.isp == null) {
      return null;
    }

    return $IspCopyWith<$Res>(_value.isp!, (value) {
      return _then(_value.copyWith(isp: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThrustSeaLevelCopyWith<$Res>? get thrustSeaLevel {
    if (_value.thrustSeaLevel == null) {
      return null;
    }

    return $ThrustSeaLevelCopyWith<$Res>(_value.thrustSeaLevel!, (value) {
      return _then(_value.copyWith(thrustSeaLevel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThrustSeaLevelCopyWith<$Res>? get thrustVacuum {
    if (_value.thrustVacuum == null) {
      return null;
    }

    return $ThrustSeaLevelCopyWith<$Res>(_value.thrustVacuum!, (value) {
      return _then(_value.copyWith(thrustVacuum: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnginesImplCopyWith<$Res> implements $EnginesCopyWith<$Res> {
  factory _$$EnginesImplCopyWith(
          _$EnginesImpl value, $Res Function(_$EnginesImpl) then) =
      __$$EnginesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Isp? isp,
      ThrustSeaLevel? thrustSeaLevel,
      ThrustSeaLevel? thrustVacuum,
      int? number,
      String? type,
      String? version,
      String? layout,
      int? engineLossMax,
      String? propellant1,
      String? propellant2,
      int? thrustToWeight});

  @override
  $IspCopyWith<$Res>? get isp;
  @override
  $ThrustSeaLevelCopyWith<$Res>? get thrustSeaLevel;
  @override
  $ThrustSeaLevelCopyWith<$Res>? get thrustVacuum;
}

/// @nodoc
class __$$EnginesImplCopyWithImpl<$Res>
    extends _$EnginesCopyWithImpl<$Res, _$EnginesImpl>
    implements _$$EnginesImplCopyWith<$Res> {
  __$$EnginesImplCopyWithImpl(
      _$EnginesImpl _value, $Res Function(_$EnginesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isp = freezed,
    Object? thrustSeaLevel = freezed,
    Object? thrustVacuum = freezed,
    Object? number = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? layout = freezed,
    Object? engineLossMax = freezed,
    Object? propellant1 = freezed,
    Object? propellant2 = freezed,
    Object? thrustToWeight = freezed,
  }) {
    return _then(_$EnginesImpl(
      isp: freezed == isp
          ? _value.isp
          : isp // ignore: cast_nullable_to_non_nullable
              as Isp?,
      thrustSeaLevel: freezed == thrustSeaLevel
          ? _value.thrustSeaLevel
          : thrustSeaLevel // ignore: cast_nullable_to_non_nullable
              as ThrustSeaLevel?,
      thrustVacuum: freezed == thrustVacuum
          ? _value.thrustVacuum
          : thrustVacuum // ignore: cast_nullable_to_non_nullable
              as ThrustSeaLevel?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as String?,
      engineLossMax: freezed == engineLossMax
          ? _value.engineLossMax
          : engineLossMax // ignore: cast_nullable_to_non_nullable
              as int?,
      propellant1: freezed == propellant1
          ? _value.propellant1
          : propellant1 // ignore: cast_nullable_to_non_nullable
              as String?,
      propellant2: freezed == propellant2
          ? _value.propellant2
          : propellant2 // ignore: cast_nullable_to_non_nullable
              as String?,
      thrustToWeight: freezed == thrustToWeight
          ? _value.thrustToWeight
          : thrustToWeight // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnginesImpl implements _Engines {
  _$EnginesImpl(
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

  factory _$EnginesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnginesImplFromJson(json);

  @override
  final Isp? isp;
  @override
  final ThrustSeaLevel? thrustSeaLevel;
  @override
  final ThrustSeaLevel? thrustVacuum;
  @override
  final int? number;
  @override
  final String? type;
  @override
  final String? version;
  @override
  final String? layout;
  @override
  final int? engineLossMax;
  @override
  final String? propellant1;
  @override
  final String? propellant2;
  @override
  final int? thrustToWeight;

  @override
  String toString() {
    return 'Engines(isp: $isp, thrustSeaLevel: $thrustSeaLevel, thrustVacuum: $thrustVacuum, number: $number, type: $type, version: $version, layout: $layout, engineLossMax: $engineLossMax, propellant1: $propellant1, propellant2: $propellant2, thrustToWeight: $thrustToWeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnginesImpl &&
            (identical(other.isp, isp) || other.isp == isp) &&
            (identical(other.thrustSeaLevel, thrustSeaLevel) ||
                other.thrustSeaLevel == thrustSeaLevel) &&
            (identical(other.thrustVacuum, thrustVacuum) ||
                other.thrustVacuum == thrustVacuum) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.engineLossMax, engineLossMax) ||
                other.engineLossMax == engineLossMax) &&
            (identical(other.propellant1, propellant1) ||
                other.propellant1 == propellant1) &&
            (identical(other.propellant2, propellant2) ||
                other.propellant2 == propellant2) &&
            (identical(other.thrustToWeight, thrustToWeight) ||
                other.thrustToWeight == thrustToWeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isp,
      thrustSeaLevel,
      thrustVacuum,
      number,
      type,
      version,
      layout,
      engineLossMax,
      propellant1,
      propellant2,
      thrustToWeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnginesImplCopyWith<_$EnginesImpl> get copyWith =>
      __$$EnginesImplCopyWithImpl<_$EnginesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnginesImplToJson(
      this,
    );
  }
}

abstract class _Engines implements Engines {
  factory _Engines(
      {final Isp? isp,
      final ThrustSeaLevel? thrustSeaLevel,
      final ThrustSeaLevel? thrustVacuum,
      final int? number,
      final String? type,
      final String? version,
      final String? layout,
      final int? engineLossMax,
      final String? propellant1,
      final String? propellant2,
      final int? thrustToWeight}) = _$EnginesImpl;

  factory _Engines.fromJson(Map<String, dynamic> json) = _$EnginesImpl.fromJson;

  @override
  Isp? get isp;
  @override
  ThrustSeaLevel? get thrustSeaLevel;
  @override
  ThrustSeaLevel? get thrustVacuum;
  @override
  int? get number;
  @override
  String? get type;
  @override
  String? get version;
  @override
  String? get layout;
  @override
  int? get engineLossMax;
  @override
  String? get propellant1;
  @override
  String? get propellant2;
  @override
  int? get thrustToWeight;
  @override
  @JsonKey(ignore: true)
  _$$EnginesImplCopyWith<_$EnginesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
