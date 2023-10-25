import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_forecast_app/core/base/base_provider.dart';
import 'package:my_forecast_app/core/extention/extention.dart';
import 'package:my_forecast_app/model/response/forecast_response.dart';

import '../../service/api_handling.dart';

class HomeProvider extends BaseProvider{

  Location? _location;
  Location? get location => _location;
  set location(Location? val){
    _location = val;
    notifyListeners();
  }

  CurrentWeather? _weather;
  CurrentWeather? get weather => _weather;
  set weather(CurrentWeather? val){
    _weather = val;
    notifyListeners();
  }

  Forecast? _forecast;
  Forecast? get forecast => _forecast;
  set forecast(Forecast? val){
    _forecast = val;
    notifyListeners();
  }

  List<Hour> hoursList = [];

  Future getForecast(BuildContext ctx, String latLng, ) async {
    try {
      setLoading(true);
      await ApiHandling.hitApi<ForecastResponse>(
          apiRep.apiService.getForecast(latLng, 3), (response) {
            location = response.location;
            weather = response.current;
            forecast = response.forecast;
            final fDays = forecast?.forecastDays;
            if(fDays != null){
              for(var fDay in fDays){
                final hours = fDay.hour;
                if(hours != null){
                  hoursList.addAll(hours);
                }
              }
            }

      }, (failed) {
        ctx.showShackBar(failed.messageError);
      }, onAfter: () {
        setLoading(false);
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
    }
  }

  Future<void> getCurrentForecast(BuildContext context) async {
    setLoading(true);
    final hasPermission = await helper.handleLocationPermission(context);
    print('has Permission: $hasPermission');
    if (!hasPermission) return;
    setLoading(true);
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      // ref.setLoading(false);
      getForecast(context, '${position.latitude}, ${position.longitude}');
      // _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      setLoading(false);
      debugPrint(e);
    });
  }
}