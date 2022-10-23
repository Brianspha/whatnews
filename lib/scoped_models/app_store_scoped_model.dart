import 'package:scoped_model/scoped_model.dart';
import 'package:whatnews/models/application/app_details.dart';
import 'package:whatnews/models/location/user_location_details_model.dart';

class AppScopedModel extends Model {
  AppDetails? _appDetails;
  UserLocationDetailsModel? _userLocationDetailsModel;

  AppDetails get getApplicationDetails => _appDetails!;
  UserLocationDetailsModel get getUserLocationDetails =>
      _userLocationDetailsModel!;
  void setApplicationDetails(AppDetails? details) {
    _appDetails = details;
    notifyListeners();
  }

  void setLocationDetails(UserLocationDetailsModel? details) {
    _userLocationDetailsModel = details;
    notifyListeners();
  }
}
