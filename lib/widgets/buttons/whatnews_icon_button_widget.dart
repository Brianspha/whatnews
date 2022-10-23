import 'package:flutter/material.dart';

class WhatNewsIconButtonWidget extends StatelessWidget {
  final double iconSize;
  final Icon icon;
  final VoidCallback onPressed;

  const WhatNewsIconButtonWidget(
      {Key? key,
      required this.iconSize,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: iconSize,
    );
  }
}
