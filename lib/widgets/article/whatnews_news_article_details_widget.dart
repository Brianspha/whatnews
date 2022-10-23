import 'package:flutter/cupertino.dart';
import 'package:whatnews/models/article/news_article_model.dart';
import '../../shared/ui/app_colors.dart';
import '../../shared/ui/size_config.dart';
import '../buttons/whatnews_text_button_widget.dart';
import '../webview/whatnews_webview_widget.dart';

class WhatNewsArticleDetailsWidget extends StatelessWidget {
  const WhatNewsArticleDetailsWidget({
    Key? key,
    required this.newsArticleModel,
  }) : super(key: key);

  final NewsArticleModel newsArticleModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 90,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 0.5),
            child: SizedBox(
              width: SizeConfig.safeBlockHorizontal * 12,
              height: SizeConfig.safeBlockVertical * 6,
              child: WhatNewsTextButtonWidget(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonTextColor: darkGrey,
                buttonTitle: 'Close',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 0.5),
            child: SizedBox(
              width: SizeConfig.safeBlockHorizontal * 100,
              height: SizeConfig.safeBlockVertical * 80,
              child: WhatNewsWebViewWidget(
                url: newsArticleModel.url,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
