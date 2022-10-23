import 'package:flutter/material.dart';
import 'package:whatnews/shared/ui/size_config.dart';

class WhatNewsBaseContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool allowBackPress;
  const WhatNewsBaseContainer(
      {Key? key,
      required this.child,
      required this.color,
      required this.allowBackPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Container(
                color: color,
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockVertical * 100,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 2.5),
                    child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(), child: child))),
          )),
      onWillPop: () {
        return Future.value(allowBackPress); // if true allow back else block it
      },
    );
  }
}
