import 'package:flutter/cupertino.dart';
import 'package:whatnews/shared/ui/size_config.dart';

class WhatNewsTextWidget17 extends StatelessWidget {
  final String text;
  final Color fontColor;

  const WhatNewsTextWidget17(
      {Key? key, required this.text, required this.fontColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 10, color: fontColor),
    );
  }
}
