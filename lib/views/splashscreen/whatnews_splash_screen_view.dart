
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:whatnews/shared/ui/app_colors.dart';
import 'package:whatnews/widgets/container/whatnews_base_container.dart';
import 'package:whatnews/widgets/text/whatnews_text_widget_13.dart';

import '../../locators/service_locator.dart';
import '../../models/article/news_article_model.dart';
import '../../models/article/news_article_request_model.dart';
import '../../models/source/news_source_model.dart';
import '../../scoped_models/app_store_scoped_model.dart';
import '../../scoped_models/news_repository_scoped_model.dart';
import '../../services/repository/news_repository.dart';
import '../../shared/ui/size_config.dart';
import '../../widgets/text/whatnews_normal_text_widget_font24.dart';
import '../dashboard/dashboard_view.dart';

class WhatNewsSplashScreenView extends StatefulWidget {
  const WhatNewsSplashScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WhatNewsSplashScreenViewState();
  }
}

class _WhatNewsSplashScreenViewState extends State<WhatNewsSplashScreenView> {
  final AppScopedModel _appScopedModel = locator.get<AppScopedModel>();
  final NewsRepository _newsRepository = locator.get<NewsRepository>();
  final NewsRepositoryScopedModel _newsRepositoryScopedModel =
      locator.get<NewsRepositoryScopedModel>();
  @override
  void initState() {
    // TODO: implement initState
    locator
        .get<NewsRepository>()
        .getNewsSources()
        .then((List<NewsSourceModel> sources) async {
      locator.get<NewsRepositoryScopedModel>().setLatestSources(sources);
      List<NewsArticleModel> articles = await _newsRepository.getNewArticles(
          NewsArticleRequestModel(
              source: "",
              articleMentions: "",
              numberOfArticles: 1,
              country: _appScopedModel.getUserLocationDetails.countryCode));
      setState(() {
        _newsRepositoryScopedModel.setLatestNewsArticles(articles);
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const DashboardView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: WhatNewsBaseContainer(
        color: secondaryColor,
        allowBackPress: false,
        child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.safeBlockVertical * 25),
                child: dotenv.env["DEVELOPMENT"] == "true"
                    ? const WhatNewsTextWidgetFont24(
                        textColor: lightGrey,
                        fontWeight: FontWeight.bold,
                        text: "WhatNews beta",
                      )
                    : const WhatNewsTextWidgetFont24(
                        textColor: lightGrey,
                        fontWeight: FontWeight.bold,
                        text: "WhatNews",
                      )),
            Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.safeBlockVertical * 50),
                child: Column(
                  children: [
                    Padding(
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                        height: SizeConfig.safeBlockVertical * 2,
                        child: const LoadingIndicator(
                          indicatorType: Indicator.ballBeat,

                          /// Required, The loading type of the widget
                          colors: [primaryColor],

                          /// Optional, The color collections
                          strokeWidth: 0,

                          /// Optional, The stroke of the line, only applicable to widget which contains line
                          backgroundColor: Colors.transparent,

                          /// Optional, Background of the widget
                        ),
                      ),
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.safeBlockVertical * 3),
                    ),
                    WhatNewsTextWidget13(
                      textColor: lightGrey,
                      text:
                          "v ${_appScopedModel.getApplicationDetails.version.toString()}",
                      fontWeight: FontWeight.normal,
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
