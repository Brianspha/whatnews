import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:whatnews/models/article/news_article_model.dart';
import 'package:whatnews/models/article/news_article_request_model.dart';
import 'package:whatnews/scoped_models/news_repository_scoped_model.dart';
import 'package:whatnews/shared/ui/app_colors.dart';
import 'package:whatnews/widgets/textfields/whatnews_search_textfiled_widget.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../locators/service_locator.dart';
import '../../services/repository/news_repository.dart';
import '../../shared/ui/size_config.dart';
import '../../widgets/article/whatnews_category_container_widget.dart';
import '../../widgets/container/whatnews_main_container.dart';
import '../../widgets/text/whatnews_text_widget_15.dart';
import '../category/whatnews_category_view.dart';

class WhatNewsSearchView extends StatefulWidget {
  const WhatNewsSearchView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WhatNewsSearchViewState();
  }
}

class _WhatNewsSearchViewState extends State<WhatNewsSearchView> {
  bool _isLoading = false;
  final NewsRepository _newsRepository = locator.get<NewsRepository>();
  final NewsRepositoryScopedModel _newScopedModel =
      locator.get<NewsRepositoryScopedModel>();
  final List<String> _initialSearchList = <String>[];
  final TextEditingController _searchController = TextEditingController();
  String _selectedSourceName = "",
      _selectedCategory = "",
      _selectedCountry = "";
  List<String> sourceNames = [], categoryNames = [], countryNames = [];
  @override
  void initState() {
    setState(() {
      sourceNames =
          _newScopedModel.getNewsSources.map((source) => source.name).toList();
      categoryNames = _newScopedModel.getNewsSources
          .map((source) {
            Map<String, dynamic> mapped = source.toMap();
            return toBeginningOfSentenceCase(mapped["category"].toString())
                .toString();
          })
          .toList()
          .toSet()
          .toList();
      countryNames = _newScopedModel.getNewsSources
          .map((source) {
            var countries = Countries.list
                .where((country) =>
                    country.isoCode == source.country.toUpperCase())
                .toList();
            Country country =
                countries.isNotEmpty ? countries.first : Country.empty();
            return country.name;
          })
          .cast<String>()
          .toSet()
          .toList()
          .where((country) => country.isNotEmpty)
          .toList();
      _initialSearchList.addAll(categoryNames);
      _initialSearchList.addAll(countryNames);
      _initialSearchList.addAll(sourceNames);
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoadingOverlay(
        isLoading: _isLoading,
        color: loadingIndicatorBackGroundColor,
        progressIndicator: const Center(
          child: SpinKitDualRing(
            color: secondaryColor,
          ),
        ),
        child: WhatNewsMainContainer(
            child: Column(children: [
              Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                  child: const WhatNewsTextWidget15(
                    text: "Search",
                    fontColor: darkGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                child: WhatNewsSearchTextFieldWidget(
                  initialSearchList: _initialSearchList,
                  title: "Search",
                  onSearch: (source) async {
                    setState(() {
                      _isLoading = true;
                    });
                    List<NewsArticleModel> newsArticles = await _newsRepository
                        .getNewArticlesMentions(NewsArticleRequestModel(
                            source: source,
                            articleMentions: source,
                            numberOfArticles: 100,
                            country: ""));
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => WhatNewsCategoryView(
                                  articles: newsArticles,
                                  category: source,
                                )));
                  },
                  textEditingController: _searchController,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: secondaryColor,
                      width: SizeConfig.safeBlockVertical * 0.2,
                    ),
                  )),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                child: WhatNewsCategoryContainerWidget(
                  onChanged: (String name) async {
                    setState(() {
                      _selectedCountry = "";
                      _selectedCategory = "";
                      _selectedSourceName = name;
                      _isLoading = true;
                    });
                    List<NewsArticleModel> newsArticles = await _newsRepository
                        .getNewArticlesMentions(NewsArticleRequestModel(
                            source: _selectedSourceName.toLowerCase(),
                            articleMentions: _selectedSourceName.toLowerCase(),
                            numberOfArticles: 100,
                            country: ""));
                    if (newsArticles.isEmpty) {
                      newsArticles = await _newsRepository
                          .getNewArticlesBySource(NewsArticleRequestModel(
                              source: _selectedSourceName.toLowerCase(),
                              articleMentions:
                                  _selectedSourceName.toLowerCase(),
                              numberOfArticles: 100,
                              country: ""));
                    }

                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => WhatNewsCategoryView(
                                  articles: newsArticles,
                                  category: _selectedSourceName,
                                )));
                  },
                  selectedItem: _selectedSourceName,
                  values: sourceNames,
                  title: 'Media Outlets',
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                child: WhatNewsCategoryContainerWidget(
                  onChanged: (String name) async {
                    setState(() {
                      _selectedCategory = name;
                      _selectedSourceName = "";
                      _isLoading = true;
                    });
                    List<NewsArticleModel> newsArticles = await _newsRepository
                        .getNewArticlesMentions(NewsArticleRequestModel(
                            source: _selectedSourceName,
                            articleMentions: _selectedSourceName,
                            numberOfArticles: 100,
                            country: _selectedCountry));
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => WhatNewsCategoryView(
                                  articles: newsArticles,
                                  category: _selectedCategory,
                                )));
                  },
                  selectedItem: _selectedCategory,
                  values: categoryNames,
                  title: 'Category',
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
                child: WhatNewsCategoryContainerWidget(
                  onChanged: (String name) async {
                    setState(() {
                      _selectedCountry = name;
                      _selectedSourceName = "";
                      _isLoading = true;
                    });
                    List<NewsArticleModel> newsArticles = <NewsArticleModel>[];
                    String countryISO = Countries.list
                        .where((country) => country.name == _selectedCountry)
                        .toList()
                        .first
                        .isoCode;
                    if (_selectedCategory.isEmpty) {
                      newsArticles = await _newsRepository.getNewArticles(
                          NewsArticleRequestModel(
                              source: _selectedSourceName,
                              articleMentions: _selectedSourceName,
                              numberOfArticles: 100,
                              country: countryISO));
                    } else {
                      newsArticles = await _newsRepository
                          .getNewArticlesBySourceAndCountry(
                              NewsArticleRequestModel(
                                  source: _selectedSourceName,
                                  articleMentions: _selectedSourceName,
                                  numberOfArticles: 100,
                                  country: countryISO));
                    }
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => WhatNewsCategoryView(
                                  articles: newsArticles,
                                  category: _selectedCategory,
                                )));
                  },
                  selectedItem: _selectedCountry,
                  values: countryNames,
                  title: 'Country',
                ),
              )
            ]),
            color: primaryColor,
            allowBackPress: false));
  }
}
