import 'package:flutter/material.dart';

import '../text/whatnews_fitted_text_widget_15.dart';

class WhatNewsTextButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final Color buttonTextColor;
  final GestureTapCallback onPressed;
  const WhatNewsTextButtonWidget(
      {Key? key,
      required this.buttonTitle,
      required this.buttonTextColor,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: onPressed,
      child: WhatNewsFittedTextWidgetFont15(
          text: buttonTitle, textColor: buttonTextColor),
    );
  }
}
