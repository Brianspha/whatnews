import 'package:flutter/cupertino.dart';
import 'package:whatnews/shared/ui/size_config.dart';

class WhatNewsFittedTextWidget13 extends StatelessWidget {
  final String text;
  final Color fontColor;
  const WhatNewsFittedTextWidget13(
      {Key? key, required this.text, required this.fontColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FittedBox(child: Text(
      text,
      style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 3.8, color: fontColor),
    ),fit: BoxFit.contain,);
  }
}
