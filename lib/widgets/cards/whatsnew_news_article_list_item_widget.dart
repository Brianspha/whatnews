import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatnews/models/article/news_article_model.dart';

import '../../shared/ui/app_colors.dart';
import '../../shared/ui/size_config.dart';
import '../text/whatnews_text_widget_10.dart';
import '../text/whatnews_text_widget_13.dart';
import 'package:timeago/timeago.dart' as timeago;

class WhatsNewNewsArticleListItemWidget extends StatelessWidget {
  final NewsArticleModel newsArticleModel;
  final GestureTapCallback onTap;
  const WhatsNewNewsArticleListItemWidget({
    Key? key,
    required this.newsArticleModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: SizeConfig.safeBlockVertical * 20,
        decoration: BoxDecoration(
            border: Border.all(
              color: secondaryColor.withOpacity(0.1),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                color: primaryColor,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ]),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 2,
                    vertical: SizeConfig.safeBlockVertical * 1),
                child: SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 35,
                  height: SizeConfig.safeBlockVertical * 35,
                  child: CachedNetworkImage(
                    imageUrl: newsArticleModel.urlToImage,
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: secondaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Ionicons.save_outline,
                      size: SizeConfig.safeBlockVertical * 10,
                      color: darkGrey,
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal * 2,
                    top: SizeConfig.safeBlockVertical * 3),
                child: Column(
                  children: [
                    SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 40,
                        child: WhatNewsTextWidget13(
                          textColor: darkGrey,
                          text: newsArticleModel.title.substring(
                                  0,
                                  (newsArticleModel.title.length / 2.5)
                                      .round()) +
                              "...",
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical * 1),
                        child: SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 40,
                          child: WhatNewsTextWidget13(
                              fontWeight: FontWeight.normal,
                              textColor: darkGrey,
                              text:
                                  timeago.format(newsArticleModel.publishedAt)),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical * 1),
                        child: SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 40,
                          child: WhatNewsTextWidget10(
                              fontWeight: FontWeight.bold,
                              textColor: darkGrey,
                              text: newsArticleModel.source.name),
                        ))
                  ],
                ))
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
