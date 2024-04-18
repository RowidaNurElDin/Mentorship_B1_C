import '../../../cache/cache_keys.dart';
import '/core/cache/cache_consumer.dart';

abstract class LocaleLocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

class LocaleLocalDataSourceImpl implements LocaleLocalDataSource {
  final CacheConsumer cacheConsumer;
  LocaleLocalDataSourceImpl({
    required this.cacheConsumer,
  });

  @override
  Future<bool> changeLang({required String langCode}) async {
    return await cacheConsumer.saveData(key: CacheKeys.locale, value: langCode);
  }

  @override
  Future<String> getSavedLang() async {
    return cacheConsumer.getData<String>(
        key: CacheKeys.locale, defaultValue: 'en');
  }
}
