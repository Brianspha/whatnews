import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:whatnews/scoped_models/app_store_scoped_model.dart';
import 'package:whatnews/scoped_models/news_repository_scoped_model.dart';
import 'package:whatnews/shared/ui/app_colors.dart';
import 'package:whatnews/shared/ui/size_config.dart';
import 'package:whatnews/widgets/text/whatnews_text_widget_15.dart';
import '../../locators/service_locator.dart';
import '../../widgets/article/whatnews_news_article_details_widget.dart';
import '../../widgets/cards/whatsnew_news_article_list_item_widget.dart';
import '../../widgets/container/whatnews_main_container.dart';

class WhatNewsMenuView extends StatefulWidget {
  const WhatNewsMenuView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WhatNewsMenuViewState();
  }
}

class _WhatNewsMenuViewState extends State<WhatNewsMenuView> {
  final AppScopedModel _appScopedModel = locator.get<AppScopedModel>();
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  final NewsRepositoryScopedModel _newsRepositoryScopedModel =
      locator.get<NewsRepositoryScopedModel>();

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return WhatNewsMainContainer(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
            child: WhatNewsTextWidget15(
              text:
                  "Top News In ${_appScopedModel.getUserLocationDetails.countryName}",
              fontColor: darkGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _newsRepositoryScopedModel.getLatestNewsArticles.length,
            controller: _scrollController,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
                child: WhatsNewNewsArticleListItemWidget(
                  newsArticleModel:
                      _newsRepositoryScopedModel.getLatestNewsArticles[index],
                  onTap: () {
                    showMaterialModalBottomSheet(
                      bounce: true,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Padding(
                          child: WhatNewsArticleDetailsWidget(
                            newsArticleModel: _newsRepositoryScopedModel
                                .getLatestNewsArticles[index],
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 2.5),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ))
        ]),
        color: primaryColor,
        allowBackPress: false);
  }
}
