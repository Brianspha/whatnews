import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:whatnews/shared/ui/app_colors.dart';
import 'package:whatnews/widgets/cards/whatsnew_news_article_list_item_widget.dart';
import '../../models/article/news_article_model.dart';
import '../../shared/ui/size_config.dart';
import '../../widgets/article/whatnews_news_article_details_widget.dart';
import '../../widgets/buttons/whatnews_icon_button_widget.dart';
import '../../widgets/buttons/whatnews_text_button_outlined_widget.dart';
import '../../widgets/container/whatnews_main_container.dart';
import '../../widgets/text/whatnews_text_widget_15.dart';

class WhatNewsCategoryView extends StatefulWidget {
  final String category;
  final List<NewsArticleModel> articles;
  const WhatNewsCategoryView(
      {Key? key, required this.category, required this.articles})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WhatNewsCategoryViewState();
  }
}

class _WhatNewsCategoryViewState extends State<WhatNewsCategoryView> {
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WhatNewsMainContainer(
        child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.safeBlockHorizontal * 5),
                      child: WhatNewsIconButtonWidget(
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: secondaryColor,
                        ),
                        iconSize: SizeConfig.safeBlockHorizontal * 5,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: WhatNewsTextWidget15(
                        text: widget.category,
                        fontColor: darkGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            Expanded(
                child: widget.articles.isEmpty
                    ? Center(
                        child: WhatNewsTextButtonOutlinedWidget(
                          buttonTextColor: darkGrey,
                          buttonTitle:
                              'No articles found in Category ${widget.category}',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          buttonBorderColor: secondaryColor,
                          buttonColor: primaryColor,
                          width: SizeConfig.safeBlockHorizontal * 70,
                        ),
                      )
                    : ListView.builder(
                        itemCount: widget.articles.length,
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.safeBlockVertical * 1),
                            child: WhatsNewNewsArticleListItemWidget(
                              newsArticleModel: widget.articles[index],
                              onTap: () {
                                showMaterialModalBottomSheet(
                                  bounce: true,
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    child: Padding(
                                      child: WhatNewsArticleDetailsWidget(
                                        newsArticleModel:
                                            widget.articles[index],
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.safeBlockHorizontal *
                                                  2.5),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ))
          ],
        ),
        color: primaryColor,
        allowBackPress: true);
  }
}
