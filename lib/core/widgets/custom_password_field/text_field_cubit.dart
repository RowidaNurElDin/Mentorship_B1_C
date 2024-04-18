import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldCubit extends Cubit<bool> {
  TextFieldCubit({bool startWith = true}) : super(startWith);

  void changeState({bool? newState}) => emit(newState ?? !state);
}
