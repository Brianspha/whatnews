import 'package:flutter/material.dart';
import 'package:whatnews/shared/ui/app_colors.dart';
import 'package:whatnews/widgets/text/whatnews_text_widget_15.dart';

class WhatNewsOutlinedButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  final Color buttonColor;
  final double width, height;
  final FontWeight fontWeight;
  const WhatNewsOutlinedButtonWidget(
      {Key? key,
      required this.onTap,
      required this.buttonColor,
      required this.buttonTitle,
      required this.width,
      required this.height,
      required this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
              foregroundColor: MaterialStateProperty.all<Color>(buttonColor)),
          onPressed: onTap,
          child: Center(
              child: WhatNewsTextWidget15(
            text: buttonTitle,
            fontColor: textInputColorWhiteLight,
            fontWeight: fontWeight,
          )),
        ));
  }
}
