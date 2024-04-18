import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextFieldErrorCubit extends Cubit<int> {
  PasswordTextFieldErrorCubit({int startWith = 0}) : super(startWith);

  void changeState({int? newState}) {
    emit(newState ?? state + 1);
  }

  bool noError = true;
  bool? hasErrorWithLength;
  bool? hasErrorWithUpperCase;
}
