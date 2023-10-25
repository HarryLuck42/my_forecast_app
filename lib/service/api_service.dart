
import 'package:dio/dio.dart';
import 'package:my_forecast_app/model/response/forecast_response.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService{
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  @GET("forecast.json")
  Future<ForecastResponse> getForecast(@Query('q') String latLng, @Query('days') int day);

}