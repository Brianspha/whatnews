import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

import '../../shared/ui/app_colors.dart';
import '../../shared/ui/size_config.dart';
import '../text/whatnews_text_widget_13.dart';

class WhatNewsCategoryContainerWidget extends StatelessWidget {
  final String selectedItem, title;
  final List<String> values;
  final void Function(String) onChanged;
  const WhatNewsCategoryContainerWidget(
      {Key? key,
      required this.title,
      required this.selectedItem,
      required this.values,
      required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: SizeConfig.safeBlockHorizontal * 100,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 0.5),
            child: Align(
              child: WhatNewsTextWidget13(
                text: title,
                textColor: darkGrey,
                fontWeight: FontWeight.bold,
              ),
              alignment: FractionalOffset.centerLeft,
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
              child: ChipsChoice<String>.single(
                value: selectedItem,
                onChanged: onChanged,
                choiceItems: C2Choice.listFrom<String, String>(
                  source: values,
                  value: (i, v) => values[i],
                  label: (i, v) => v,
                ),
              ))
        ],
      ),
    );
  }
}
