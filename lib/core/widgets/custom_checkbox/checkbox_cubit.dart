import 'package:bloc/bloc.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit({startWith = false}) : super(startWith);

  void changeState() => emit(!state);
}

class CheckCubit extends Cubit<bool> {
  CheckCubit(bool isChecked) : super(isChecked);

  void changeState() => emit(!state);
}
