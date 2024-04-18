import 'package:dartz/dartz.dart';
import '../../../errors/failure.dart';
import '../../../usecases/base_usecase.dart';
import '../../../usecases/no_param.dart';
import '../repositories/lang_repository.dart';

class GetSavedLangUseCase implements BaseUseCase<String, NoParams> {
  final LocaleRepository localeRepository;
  GetSavedLangUseCase({
    required this.localeRepository,
  });

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await localeRepository.getSaved();
  }
}
