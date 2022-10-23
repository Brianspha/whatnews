import 'package:flutter/cupertino.dart';
import 'package:whatnews/shared/ui/size_config.dart';

class WhatNewsTextWidget15 extends StatelessWidget {
  final String text;
  final Color fontColor;
  final FontWeight fontWeight;
  const WhatNewsTextWidget15(
      {Key? key, required this.text, required this.fontColor, required this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
          fontSize: SizeConfig.safeBlockHorizontal * 5, color: fontColor),
    );
  }
}
