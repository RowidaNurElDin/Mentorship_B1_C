import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../usecases/no_param.dart';
import '../../../widgets/toast.dart';
import '../../domain/usecases/change_locale.dart';
import '../../domain/usecases/get_saved_lang.dart';

class LocaleCubit extends Cubit<Locale> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLocaleUseCase changeLocaleUseCase;
  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLocaleUseCase})
      : super(const Locale('ar'));

  static LocaleCubit get(context) => BlocProvider.of(context);

  String _currentLangCode = 'ar';

  //get saved language
  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => null, (value) {
      _currentLangCode = value;
      emit(Locale(_currentLangCode));
    });
  }

  //change language
  Future<void> _changeLang(String lang) async {
    final response = await changeLocaleUseCase.call(lang);
    response.fold((failure) => showToast(failure.message ?? 'Error'), (value) {
      if (value) {
        _currentLangCode = lang;
        emit(Locale(_currentLangCode));
      }
    });
  }

  void changeCurrentLang() =>
      _changeLang(_currentLangCode == 'en' ? 'ar' : 'en');

  String getLocaleText() {
    return _currentLangCode.toUpperCase();
  }

  String getOppositeLocaleText() {
    return (_currentLangCode == 'en' ? 'ar' : 'en').toUpperCase();
  }

  TextDirection getDirection() {
    return _currentLangCode == 'en' ? TextDirection.ltr : TextDirection.rtl;
  }

  Locale getLocale() => state;
}
