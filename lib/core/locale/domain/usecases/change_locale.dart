import 'package:dartz/dartz.dart';
import '../../../errors/failure.dart';
import '../../../usecases/base_usecase.dart';
import '../repositories/lang_repository.dart';

class ChangeLocaleUseCase implements BaseUseCase<bool, String> {
  final LocaleRepository localeRepository;
  ChangeLocaleUseCase({
    required this.localeRepository,
  });

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await localeRepository.changeLang(langCode: params);
  }
}
