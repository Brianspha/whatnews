// To parse this JSON data, do
//
//     final userLocationDetailsModel = userLocationDetailsModelFromMap(jsonString);

import 'dart:convert';

class UserLocationDetailsModel {
  UserLocationDetailsModel({
    required this.callingCode,
    required this.city,
    required this.countryCapital,
    required this.countryCode,
    required this.countryName,
    required this.currency,
    required this.currencySymbol,
    required this.emojiFlag,
    required this.flagUrl,
    required this.ip,
    required this.isInEuropeanUnion,
    required this.latitude,
    required this.longitude,
    required this.metroCode,
    required this.organisation,
    required this.regionCode,
    required this.regionName,
    required this.timeZone,
    required this.zipCode,
  });

  final String callingCode;
  final String city;
  final String countryCapital;
  final String countryCode;
  final String countryName;
  final String currency;
  final String currencySymbol;
  final String emojiFlag;
  final String flagUrl;
  final String ip;
  final bool isInEuropeanUnion;
  final double latitude;
  final double longitude;
  final int metroCode;
  final String organisation;
  final String regionCode;
  final String regionName;
  final String timeZone;
  final String zipCode;

  factory UserLocationDetailsModel.fromJson(String str) =>
      UserLocationDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLocationDetailsModel.fromMap(Map<String, dynamic> json) =>
      UserLocationDetailsModel(
        callingCode: json["callingCode"],
        city: json["city"],
        countryCapital: json["countryCapital"],
        countryCode: json["country_code"],
        countryName: json["country_name"],
        currency: json["currency"],
        currencySymbol: json["currencySymbol"],
        emojiFlag: json["emojiFlag"],
        flagUrl: json["flagUrl"],
        ip: json["ip"],
        isInEuropeanUnion: json["is_in_european_union"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        metroCode: json["metro_code"],
        organisation: json["organisation"],
        regionCode: json["region_code"],
        regionName: json["region_name"],
        timeZone: json["time_zone"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toMap() => {
        "callingCode": callingCode,
        "city": city,
        "countryCapital": countryCapital,
        "country_code": countryCode,
        "country_name": countryName,
        "currency": currency,
        "currencySymbol": currencySymbol,
        "emojiFlag": emojiFlag,
        "flagUrl": flagUrl,
        "ip": ip,
        "is_in_european_union": isInEuropeanUnion,
        "latitude": latitude,
        "longitude": longitude,
        "metro_code": metroCode,
        "organisation": organisation,
        "region_code": regionCode,
        "region_name": regionName,
        "time_zone": timeZone,
        "zip_code": zipCode,
      };
}
