part of 'onboard_cubit.dart';

@immutable
sealed class OnboardState {}

class OnboardInitial extends OnboardState {}

class OnboardChangeIndex extends OnboardState {}

class GetBoardingLoadingState extends OnboardState {}

class GetBoardingSuccessState extends OnboardState {
  // final List<LauncherModel> boardingItems;
  // GetBoardingSuccessState(this.boardingItems);
}

class GetBoardingFailedState extends OnboardState {
  final String message;
  GetBoardingFailedState(this.message);
}
