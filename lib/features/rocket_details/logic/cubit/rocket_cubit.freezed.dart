// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rocket_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RocketState {
  RocketStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<AllRocketsResponse>? get rockets => throw _privateConstructorUsedError;
  AllRocketsResponse? get rocket => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RocketStatus status, String message,
            List<AllRocketsResponse>? rockets, AllRocketsResponse? rocket)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RocketStatus status, String message,
            List<AllRocketsResponse>? rockets, AllRocketsResponse? rocket)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RocketStatus status, String message,
            List<AllRocketsResponse>? rockets, AllRocketsResponse? rocket)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RocketStateCopyWith<RocketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RocketStateCopyWith<$Res> {
  factory $RocketStateCopyWith(
          RocketState value, $Res Function(RocketState) then) =
      _$RocketStateCopyWithImpl<$Res, RocketState>;
  @useResult
  $Res call(
      {RocketStatus status,
      String message,
      List<AllRocketsResponse>? rockets,
      AllRocketsResponse? rocket});

  $AllRocketsResponseCopyWith<$Res>? get rocket;
}

/// @nodoc
class _$RocketStateCopyWithImpl<$Res, $Val extends RocketState>
    implements $RocketStateCopyWith<$Res> {
  _$RocketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? rockets = freezed,
    Object? rocket = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RocketStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      rockets: freezed == rockets
          ? _value.rockets
          : rockets // ignore: cast_nullable_to_non_nullable
              as List<AllRocketsResponse>?,
      rocket: freezed == rocket
          ? _value.rocket
          : rocket // ignore: cast_nullable_to_non_nullable
              as AllRocketsResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AllRocketsResponseCopyWith<$Res>? get rocket {
    if (_value.rocket == null) {
      return null;
    }

    return $AllRocketsResponseCopyWith<$Res>(_value.rocket!, (value) {
      return _then(_value.copyWith(rocket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RocketStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RocketStatus status,
      String message,
      List<AllRocketsResponse>? rockets,
      AllRocketsResponse? rocket});

  @override
  $AllRocketsResponseCopyWith<$Res>? get rocket;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RocketStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? rockets = freezed,
    Object? rocket = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RocketStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      rockets: freezed == rockets
          ? _value._rockets
          : rockets // ignore: cast_nullable_to_non_nullable
              as List<AllRocketsResponse>?,
      rocket: freezed == rocket
          ? _value.rocket
          : rocket // ignore: cast_nullable_to_non_nullable
              as AllRocketsResponse?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = RocketStatus.initial,
      this.message = '',
      final List<AllRocketsResponse>? rockets,
      this.rocket})
      : _rockets = rockets;

  @override
  @JsonKey()
  final RocketStatus status;
  @override
  @JsonKey()
  final String message;
  final List<AllRocketsResponse>? _rockets;
  @override
  List<AllRocketsResponse>? get rockets {
    final value = _rockets;
    if (value == null) return null;
    if (_rockets is EqualUnmodifiableListView) return _rockets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AllRocketsResponse? rocket;

  @override
  String toString() {
    return 'RocketState.initial(status: $status, message: $message, rockets: $rockets, rocket: $rocket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._rockets, _rockets) &&
            (identical(other.rocket, rocket) || other.rocket == rocket));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_rockets), rocket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RocketStatus status, String message,
            List<AllRocketsResponse>? rockets, AllRocketsResponse? rocket)
        initial,
  }) {
    return initial(status, message, rockets, rocket);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RocketStatus status, String message,
            List<AllRocketsResponse>? rockets, AllRocketsResponse? rocket)?
        initial,
  }) {
    return initial?.call(status, message, rockets, rocket);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RocketStatus status, String message,
            List<AllRocketsResponse>? rockets, AllRocketsResponse? rocket)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(status, message, rockets, rocket);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RocketState {
  const factory _Initial(
      {final RocketStatus status,
      final String message,
      final List<AllRocketsResponse>? rockets,
      final AllRocketsResponse? rocket}) = _$InitialImpl;

  @override
  RocketStatus get status;
  @override
  String get message;
  @override
  List<AllRocketsResponse>? get rockets;
  @override
  AllRocketsResponse? get rocket;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
