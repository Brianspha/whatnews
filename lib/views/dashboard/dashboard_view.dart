import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import '../../shared/ui/app_colors.dart';
import '../../shared/ui/size_config.dart';
import '../menu/whatnews_menu_view.dart';
import '../search/whatsnew_search_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardViewState();
  }
}

class _DashboardViewState extends State<DashboardView> {
  List<Widget> _pages = [];
  List<IconData> _icons = [];
  List<String> _labels = [];
  Widget? _currentPage;
  int currentIndex = 0;
  @override
  void initState() {
    setState(() {
      _icons = [Ionicons.newspaper_outline, Ionicons.search_outline];
      _labels = ["Top Stories", "Search"];
      _pages = <Widget>[const WhatNewsMenuView(), const WhatNewsSearchView()];
      _currentPage = _pages[0];
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
            bottomNavigationBar: FloatingNavbar(
              backgroundColor: primaryColor,
              selectedItemColor: darkGrey,
              selectedBackgroundColor: secondaryColor,
              unselectedItemColor: darkGrey,
              items: [
                for (var i = 0; i < _icons.length; i++)
                  FloatingNavbarItem(icon: _icons[i], title: _labels[i]),
              ],
              currentIndex: currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentPage = _pages[index];
                  currentIndex = index;
                });
              },
            ),
            body: SafeArea(
              child: Container(
                  width: SizeConfig.safeBlockHorizontal * 100,
                  height: SizeConfig.safeBlockVertical * 100,
                  color: primaryColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 0),
                      child: _currentPage)),
            )),
        onWillPop: () {
          return Future.value(false); // if true allow back else block it
        });
  }
}
