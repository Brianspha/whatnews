import 'package:get_it/get_it.dart';
import 'package:whatnews/classes/app_cache.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../scoped_models/app_store_scoped_model.dart';
import '../scoped_models/news_repository_scoped_model.dart';
import '../services/repository/news_repository.dart';

/// @dev File contains all singletons used by the app
GetIt locator = GetIt.asNewInstance();

Future<void> setupLocator() async {
  locator.registerSingleton<AppCacheManager>(AppCacheManager(),
      signalsReady: true);
  locator.registerSingleton<AppScopedModel>(AppScopedModel(),
      signalsReady: true);
  locator.registerSingleton<NewsRepositoryScopedModel>(
      NewsRepositoryScopedModel(),
      signalsReady: true);
  locator.registerLazySingleton<NewsRepository>(() {
    NewsRepository newsRepository = NewsRepository();
    newsRepository.setupAPIService(
        dotenv.env["DEVELOPMENT"] == "true"
            ? dotenv.env["BASE_URL_DEV"]
            : dotenv.env["BASE_URL_PROD"],
        dotenv.env["DEVELOPMENT"] == "true"
            ? dotenv.env["API_KEY_DEV"]
            : dotenv.env["API_KEY_PROD"]);
    return newsRepository;
  });
}
