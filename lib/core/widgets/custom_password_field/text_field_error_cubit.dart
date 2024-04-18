import 'package:flutter_bloc/flutter_bloc.dart';

enum TextFieldErrorState {
  noError,
  hasError,
}

class TextFieldErrorCubit extends Cubit<TextFieldErrorState> {
  TextFieldErrorCubit() : super(TextFieldErrorState.noError);

  void setError() => emit(TextFieldErrorState.hasError);
  void clearError() => emit(TextFieldErrorState.noError);
}
