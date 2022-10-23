import 'package:flutter/cupertino.dart';
import 'package:whatnews/shared/ui/size_config.dart';

class WhatNewsFittedTextWidgetFont15 extends StatelessWidget {
  final String text;
  final Color textColor;
  const WhatNewsFittedTextWidgetFont15({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FittedBox(
      child: Text(
        text,
        style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5, color: textColor),
      ),
      fit: BoxFit.contain,
    );
  }
}
