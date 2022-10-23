// ignore_for_file: constant_identifier_names

import '../../classes/enum_values.dart';

enum NewsCategory {
  GENERAL,
  BUSINESS,
  TECHNOLOGY,
  SPORTS,
  ENTERTAINMENT,
  HEALTH,
  SCIENCE
}

final categoryValues = EnumValues({
  "business": NewsCategory.BUSINESS,
  "entertainment": NewsCategory.ENTERTAINMENT,
  "general": NewsCategory.GENERAL,
  "health": NewsCategory.HEALTH,
  "science": NewsCategory.SCIENCE,
  "sports": NewsCategory.SPORTS,
  "technology": NewsCategory.TECHNOLOGY
});
