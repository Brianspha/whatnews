import 'package:flutter/material.dart';

import '../../shared/ui/size_config.dart';

class WhatNewsTextWidgetFont24 extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  const WhatNewsTextWidgetFont24({
    Key? key,
    required this.text,
    required this.textColor,
    required this.fontWeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: SizeConfig.safeBlockHorizontal * 6.5),
    );
  }
}
