import 'package:flutter/cupertino.dart';
import 'package:whatnews/shared/ui/size_config.dart';

class WhatNewsTextWidget13 extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  const WhatNewsTextWidget13(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: SizeConfig.safeBlockHorizontal * 3.8,
          color: textColor),
    );
  }
}
