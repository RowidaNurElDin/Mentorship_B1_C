import 'package:flutter_bloc/flutter_bloc.dart';

class IntCubit extends Cubit<int> {
  IntCubit({int startWith = 0}) : super(startWith);

  static IntCubit get(context) => BlocProvider.of<IntCubit>(context);

  bool changeState({int? newState}) {
    if (newState != null && newState == state) return false;
    emit(newState ?? state + 1);
    return true;
  }

  void onCreate(Function function) => function();
}
