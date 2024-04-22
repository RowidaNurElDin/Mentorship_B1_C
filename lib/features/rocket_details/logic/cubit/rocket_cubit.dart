import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/networking/rockets_networking/rocket_service.dart';
import '../../../home/Data/models/all_rockets_response.dart';

part 'rocket_cubit.freezed.dart';

part 'rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  RocketCubit({
    required this.rocketService,
  }) : super(const RocketState.initial()) {
 //   init();
  }

  final RocketService rocketService;

  // Future<void> init() async {
  //   emit(
  //     state.copyWith(status: RocketStatus.loading),
  //   );
  //   try {
  //     final rockets = await rocketService.getRockets();
  //     emit(
  //       state.copyWith(
  //         status: RocketStatus.success,
  //         rockets: rockets,
  //       ),
  //     );
  //   } catch (e, st) {
  //     _handleError(e, st);
  //   }
  // }

  Future<void> getRocketDetailsById({
    required final String id,
  }) async {
    emit(
      state.copyWith(status: RocketStatus.loading),
    );
    try {
      final rocket = await rocketService.getRocket(id: id);
      emit(
        state.copyWith(
          status: RocketStatus.success,
          rocket: rocket,
        ),
      );
    } catch (e, st) {
      _handleError(e, st);
    }
  }

  void _handleError(final e, final st) {
    var message = '';
    if (e is ServerException) {
      message = e.message;
    } else if (e is CacheException) {
      message = e.message;
    } else if (e is NetworkException) {
      message = e.message;
    } else {
      message = 'Something went wrong';
    }
    emit(
      state.copyWith(
        status: RocketStatus.error,
        message: message,
      ),
    );
  }
}
