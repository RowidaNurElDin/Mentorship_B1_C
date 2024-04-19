import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/endpoints.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/data/models/launcher_model.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/data/models/rockets_model.dart';
import '../../../../core/cache/cache_consumer.dart';
import '../../../../core/cache/cache_keys.dart';
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
  RocketsModel rocketsModel = RocketsModel();

  Future getBoarding() async {
    emit(GetBoardingLoadingState());



    var headers = {
      'accept': '*/*',
      'Authorization': 'Bearer ${_cacheConsumer.getData<String?>(key: CacheKeys.token, defaultValue: null)}',
      'Content-Type': 'application/json',
      'Accept-Language':
      _cacheConsumer.getData(key: CacheKeys.locale, defaultValue: 'en') ==
          'ar'
          ? 'Arabic'
          : 'English',
    };
    var dio = Dio();
    var response = await dio.request(
      '${EndPoints.baseUrl}${EndPoints.launches}',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      launcherModel = LauncherModel.fromJson(response.data[0]);
      emit(GetBoardingSuccessState());
    }
    else if(response.statusCode! >= 401) {
      emit(GetBoardingFailedState(response.data['message']));
    }

    // final result = await _getBoardingUsecase.call(NoParams());
    // result.fold((l) => emit(GetBoardingFailedState(l.message ?? 'Error')), (r) {
    //   // launcherModel = r;
    //   rocketsModel = r;
    //   // print(r);
    //   emit(GetBoardingSuccessState());
    // });
  }
}
