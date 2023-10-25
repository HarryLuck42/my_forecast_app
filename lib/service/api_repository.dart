
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:my_forecast_app/service/api_service.dart';

import '../core/constraint/sp_keys.dart';
import '../core/memory/share_preference.dart';

class ApiRepository{
  late final Dio _dio;
  late final ApiService _apiService;

  ApiRepository(){
    _dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      contentType: "application/json",
      queryParameters: {
        'key' : '480cd8c01b4548cca6f10839232510'
      }
    ))..interceptors.add(HttpFormatter());

    // _dio.interceptors.add(AuthInterceptor());

    _apiService = ApiService(_dio, baseUrl: "http://api.weatherapi.com/v1/");
  }

  ApiService get apiService => _apiService;

}

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = SharedPreference().readStorage(SpKeys.apiToken);
    if (accessToken != null) {
      options.queryParameters['key'] = '$accessToken';
    }
    super.onRequest(options, handler);
  }
}