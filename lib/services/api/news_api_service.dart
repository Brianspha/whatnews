import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:whatnews/interfaces/i_api_service.dart';

class NewsAPIService extends IAPIService {
  final Dio _dio = Dio();
  final String? baseURL;

  NewsAPIService({required this.baseURL});

  @override
  Future<Dio> getApiClient() async {
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseURL)).interceptor);
    _dio.options.baseUrl = baseURL!;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;
    _dio.options.sendTimeout = 30000;
    return _dio;
  }

  @override
  Future<Response<T>> httpGet<T>(
      String url, Map<String, dynamic>? params) async {
    Dio dio = await getApiClient();
    if (params != null) {
      return await dio.get(url,
          queryParameters: params,
          options: buildCacheOptions(const Duration(hours: 1)));
    } else {
      return await dio.get(url);
    }
  }

  @override
  Future<Response<T>> httpPost<T>(
      String url, Map<String, dynamic>? params) async {
    Dio dio = await getApiClient();
    if (params != null) {
      return await dio.post(url, data: params);
    } else {
      return await dio.post(url);
    }
  }
}
