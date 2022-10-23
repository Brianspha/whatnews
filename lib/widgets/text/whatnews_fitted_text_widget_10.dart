import 'package:flutter/cupertino.dart';
import 'package:whatnews/shared/ui/size_config.dart';

class WhatNewsFittedTextWidget10 extends StatelessWidget {
  final String text;
  final Color fontColor;
  const WhatNewsFittedTextWidget10(
      {Key? key, required this.text, required this.fontColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FittedBox(
      child: Text(
        text,
        style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 3, color: fontColor),
      ),
      fit: BoxFit.fitWidth,
    );
  }
}
