import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/location/user_location_details_model.dart';

Future<UserLocationDetailsModel> getUserLocation() async {
  late UserLocationDetailsModel userLocationDetailsModel;
  try {
    final Dio dio = Dio();
    String? url = dotenv.env["USER_LOCATION_API_URL"];
    var data = await dio.get(url.toString());
    userLocationDetailsModel = UserLocationDetailsModel.fromMap(data.data);
  } catch (error) {
    if (kDebugMode) {
      print("error getting location: ${error.toString()}");
    }
  }
  return userLocationDetailsModel;
}
