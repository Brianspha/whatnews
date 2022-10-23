import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:whatnews/models/application/app_details.dart';
import 'package:whatnews/models/location/user_location_details_model.dart';
import 'package:whatnews/scoped_models/app_store_scoped_model.dart';
import 'package:whatnews/services/api/get_user_location_service.dart';
import 'package:whatnews/services/repository/news_repository.dart';
import 'package:whatnews/shared/ui/app_colors.dart';
import 'package:whatnews/shared/ui/utils.dart';
import 'package:whatnews/views/splashscreen/whatnews_splash_screen_view.dart';

import 'locators/service_locator.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: "assets/environment/.env");

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Future.value([
      await setupLocator(),
      await FlutterStatusbarcolor.setStatusBarColor(statusBarColor),
    ]);
    AppDetails appDetails =
        await getAppDetails(); //@dev tried using Future.wait but it doesn't work well
    UserLocationDetailsModel userLocationDetails = await getUserLocation();
    locator.get<AppScopedModel>().setApplicationDetails(appDetails);
    locator.get<AppScopedModel>().setLocationDetails(userLocationDetails);
    locator.get<NewsRepository>().setAppCacheManager();
    final webScraper = WebScraper('http://espn.go.com/nfl/story/_/id/34857974/sources-49ers-likely-christian-mccaffrey-vs-chiefs');
    if (await webScraper.loadWebPage('/test-sites/e-commerce/allinone')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('h3.title > a.caption', ['href']);
      print(elements);
    }
    runApp(const MyApp());
  }, (error, stackTrace) {
    if (kDebugMode) {
      print("error: ${error.toString()}");
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: statusBarColor,
      statusBarColor: statusBarColor,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ]);
      },
      home: const WhatNewsSplashScreenView(),
    );
  }
}
