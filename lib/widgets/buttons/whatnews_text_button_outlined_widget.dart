import 'package:flutter/material.dart';

import '../../shared/ui/size_config.dart';
import '../text/whatnews_fitted_text_widget_15.dart';

class WhatNewsTextButtonOutlinedWidget extends StatelessWidget {
  final String buttonTitle;
  final Color buttonTextColor, buttonColor, buttonBorderColor;
  final GestureTapCallback onPressed;
  final double width;
  const WhatNewsTextButtonOutlinedWidget(
      {Key? key,
      required this.buttonTitle,
      required this.buttonTextColor,
      required this.onPressed,
      required this.buttonColor,
      required this.width,
      required this.buttonBorderColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
              color: buttonBorderColor,
              width: SizeConfig.safeBlockVertical * .1),
          borderRadius: const BorderRadius.all(
              Radius.circular(60.0) //                 <--- border radius here
              ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: WhatNewsFittedTextWidgetFont15(
              text: buttonTitle, textColor: buttonTextColor),
        ));
  }
}
