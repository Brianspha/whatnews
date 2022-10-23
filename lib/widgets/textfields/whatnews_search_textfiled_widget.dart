import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../shared/ui/app_colors.dart';

class WhatNewsSearchTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged onSearch;
  final String title;
  final Decoration decoration;
  final List<String> initialSearchList;
  const WhatNewsSearchTextFieldWidget(
      {Key? key,
      required this.textEditingController,
      required this.onSearch,
      required this.title,
      required this.decoration,
      required this.initialSearchList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomSearchableDropDown(
      items: initialSearchList,
      label: title,
      decoration: decoration,
      prefixIcon: const Padding(
        padding: EdgeInsets.all(0.0),
        child: Icon(
          Ionicons.search_outline,
          color: secondaryColor,
        ),
      ),
      dropDownMenuItems: initialSearchList.map((item) {
        return item;
      }).toList(),
      onChanged: onSearch,
    );
  }
}
