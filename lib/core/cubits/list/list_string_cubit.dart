import 'package:flutter_bloc/flutter_bloc.dart';

class ListStringCubit extends Cubit<List<String>> {
  ListStringCubit({List<String> startWith = const []}) : super(startWith);

  static ListStringCubit get(context) =>
      BlocProvider.of<ListStringCubit>(context);
  List<String> dataList = [];

  bool changeState({List<String>? newState}) {
    dataList.addAll(newState ?? state);
    emit(List<String>.from(dataList));
    return true;
  }

  void removeState({String? newState}) {
    final data = dataList;
    data.removeWhere((element) => element == newState);
    emit(List<String>.from(data));
  }

  void onCreate(Function function) => function();
  void setData() => dataList = state;
}
