// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whatnews/locators/service_locator.dart';

import 'package:whatnews/main.dart';
import 'package:whatnews/models/source/news_source_model.dart';
import 'package:whatnews/scoped_models/app_store_scoped_model.dart';
import 'package:whatnews/scoped_models/news_repository_scoped_model.dart';
import 'package:whatnews/services/repository/news_repository.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/environment/.env");
  await setupLocator();
  final AppScopedModel _appScopedModel = locator.get<AppScopedModel>();
  final NewsRepository _newsRepository = locator.get<NewsRepository>();
  final NewsRepositoryScopedModel _newsRepositoryScopedModel =
      locator.get<NewsRepositoryScopedModel>();
  group("TelehealthService", () {
    test("Should fetch sources from API", () async {
      List<NewsSourceModel> sources = await _newsRepository.getNewsSources();
      // Verify that our counter starts at 0.
      expect(sources.isNotEmpty, true);
    });
  });
}
