import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/data/models/launcher_model.dart';
import '../../../../core/cache/cache_consumer.dart';
import '../../../../core/usecases/no_param.dart';
import '../../domain/usecases/get_boarding_usecase.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit(this._getBoardingUsecase, this._cacheConsumer)
      : super(OnboardInitial());

  final GetBoardingUsecase _getBoardingUsecase;
  final CacheConsumer _cacheConsumer;

  OnboardCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> onboardTitles = [
    'Discover all upcoming and past rockets launching of SpaceX',
    'Discover all upcoming and past rockets launching of SpaceX',
    'Discover all upcoming and past rockets launching of SpaceX',
  ];
  List<String> onboardImages = [
    'https://imgur.com/azYafd8.jpg',
    'https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg',
    'https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg'

  ];

  changeIndex({required int index}) {
    currentIndex = index;
    emit(OnboardChangeIndex());
  }

  LauncherModel launcherModel = LauncherModel();

  Future getBoarding() async {
    emit(GetBoardingLoadingState());
    final result = await _getBoardingUsecase.call(NoParams());
    result.fold((l) => emit(GetBoardingFailedState(l.message ?? 'Error')), (r) {
      // launcherModel = r;
      emit(GetBoardingSuccessState());
    });
  }
}
