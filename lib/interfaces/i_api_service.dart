import 'package:dio/dio.dart';

/// @dev Class contains functions to be implemented by any client that inherits from this class
abstract class IAPIService {

  Future<Dio> getApiClient();
  Future<Response<T>> httpGet<T>(String url, Map<String, dynamic> params);
  Future<Response<T>> httpPost<T>(String url, Map<String, dynamic> params);
}
