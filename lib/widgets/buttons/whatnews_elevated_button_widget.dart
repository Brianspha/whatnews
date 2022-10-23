import 'package:flutter/material.dart';

class WhatNewsElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  final Color buttonColor;
  final double width, height;
  final Widget child;
  const WhatNewsElevatedButtonWidget(
      {Key? key,
      required this.onTap,
      required this.buttonColor,
      required this.width,
      required this.height,
      required this.child,
      required this.buttonTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                foregroundColor: MaterialStateProperty.all<Color>(buttonColor)),
            onPressed: onTap,
            child: child));
  }
}
