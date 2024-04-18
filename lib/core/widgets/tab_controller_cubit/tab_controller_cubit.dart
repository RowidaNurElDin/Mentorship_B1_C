import 'package:bloc/bloc.dart';

class TapControllerCubit extends Cubit<int> {
  TapControllerCubit({int startValue = 0}) : super(startValue);

  bool changeIndex(int index) {
    if (index == state) return false;
    emit(index);
    return true;
  }

  Future<void> onCreate(Future<void> Function() function) async {
    await function();
  }
}
