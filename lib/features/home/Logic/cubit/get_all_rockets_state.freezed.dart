// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_rockets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllRocketsState<T> {
  GetRocketsState get state => throw _privateConstructorUsedError;
  List<AllRocketsResponse> get allRockets => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetRocketsState state,
            List<AllRocketsResponse> allRockets, Failure? failure)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetRocketsState state,
            List<AllRocketsResponse> allRockets, Failure? failure)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetRocketsState state, List<AllRocketsResponse> allRockets,
            Failure? failure)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetAllRocketsStateCopyWith<T, GetAllRocketsState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllRocketsStateCopyWith<T, $Res> {
  factory $GetAllRocketsStateCopyWith(GetAllRocketsState<T> value,
          $Res Function(GetAllRocketsState<T>) then) =
      _$GetAllRocketsStateCopyWithImpl<T, $Res, GetAllRocketsState<T>>;
  @useResult
  $Res call(
      {GetRocketsState state,
      List<AllRocketsResponse> allRockets,
      Failure? failure});
}

/// @nodoc
class _$GetAllRocketsStateCopyWithImpl<T, $Res,
        $Val extends GetAllRocketsState<T>>
    implements $GetAllRocketsStateCopyWith<T, $Res> {
  _$GetAllRocketsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? allRockets = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GetRocketsState,
      allRockets: null == allRockets
          ? _value.allRockets
          : allRockets // ignore: cast_nullable_to_non_nullable
              as List<AllRocketsResponse>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res>
    implements $GetAllRocketsStateCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {GetRocketsState state,
      List<AllRocketsResponse> allRockets,
      Failure? failure});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$GetAllRocketsStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? allRockets = null,
    Object? failure = freezed,
  }) {
    return _then(_$InitialImpl<T>(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GetRocketsState,
      allRockets: null == allRockets
          ? _value._allRockets
          : allRockets // ignore: cast_nullable_to_non_nullable
              as List<AllRocketsResponse>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl(
      {this.state = GetRocketsState.loading,
      final List<AllRocketsResponse> allRockets = const [],
      this.failure})
      : _allRockets = allRockets;

  @override
  @JsonKey()
  final GetRocketsState state;
  final List<AllRocketsResponse> _allRockets;
  @override
  @JsonKey()
  List<AllRocketsResponse> get allRockets {
    if (_allRockets is EqualUnmodifiableListView) return _allRockets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allRockets);
  }

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'GetAllRocketsState<$T>.initial(state: $state, allRockets: $allRockets, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl<T> &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._allRockets, _allRockets) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state,
      const DeepCollectionEquality().hash(_allRockets), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<T, _$InitialImpl<T>> get copyWith =>
      __$$InitialImplCopyWithImpl<T, _$InitialImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetRocketsState state,
            List<AllRocketsResponse> allRockets, Failure? failure)
        initial,
  }) {
    return initial(state, allRockets, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetRocketsState state,
            List<AllRocketsResponse> allRockets, Failure? failure)?
        initial,
  }) {
    return initial?.call(state, allRockets, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetRocketsState state, List<AllRocketsResponse> allRockets,
            Failure? failure)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(state, allRockets, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements GetAllRocketsState<T> {
  const factory _Initial(
      {final GetRocketsState state,
      final List<AllRocketsResponse> allRockets,
      final Failure? failure}) = _$InitialImpl<T>;

  @override
  GetRocketsState get state;
  @override
  List<AllRocketsResponse> get allRockets;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<T, _$InitialImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
