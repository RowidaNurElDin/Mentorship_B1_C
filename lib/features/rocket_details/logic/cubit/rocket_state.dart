

part of 'rocket_cubit.dart';

enum RocketStatus {
  initial,
  loading,
  error,
  success,
}

@freezed
class RocketState with _$RocketState {
  const factory RocketState.initial({
    @Default(RocketStatus.initial) final RocketStatus status,
    @Default('') final String message,

    final List<AllRocketsResponse>? rockets,
    final AllRocketsResponse? rocket,
  }) = _Initial;
}
