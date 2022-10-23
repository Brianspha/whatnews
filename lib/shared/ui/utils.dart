import 'package:package_info_plus/package_info_plus.dart';

import '../../models/application/app_details.dart';

Future<AppDetails> getAppDetails() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return AppDetails(
      appName: "WhatsNew",
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      packageName: packageInfo.packageName);
}
