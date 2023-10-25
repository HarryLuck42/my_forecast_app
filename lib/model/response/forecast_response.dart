import 'package:json_annotation/json_annotation.dart';

part 'forecast_response.g.dart';

@JsonSerializable()
class ForecastResponse{
  @JsonKey(name: 'location')
  Location? location;

  @JsonKey(name: 'current')
  CurrentWeather? current;

  @JsonKey(name: 'forecast')
  Forecast? forecast;

  ForecastResponse({
    this.location,
    this.current,
    this.forecast});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}

@JsonSerializable()
class Location{
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'region')
  String? region;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'lat')
  double? lat;

  @JsonKey(name: 'lon')
  double? lon;

  @JsonKey(name: 'tz_id')
  String? tzId;

  @JsonKey(name: 'localtime_epoch')
  int? localtimeEpoch;

  @JsonKey(name: 'localtime')
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class CurrentWeather{
  @JsonKey(name: 'last_updated_epoch')
  int? lastUpdatedEpoch;

  @JsonKey(name: 'last_updated')
  String? lastUpdated;

  @JsonKey(name: 'temp_c')
  double? temperature;

  @JsonKey(name: 'condition')
  Condition? condition;

  @JsonKey(name: 'wind_kph')
  double? windKph;

  @JsonKey(name: 'wind_degree')
  int? windDegree;

  @JsonKey(name: 'wind_dir')
  String? windDir;

  @JsonKey(name: 'pressure_mb')
  double? pressureMb;

  @JsonKey(name: 'pressure_in')
  double? pressureIn;

  @JsonKey(name: 'humidity')
  int? humidity;

  @JsonKey(name: 'cloud')
  int? cloud;

  @JsonKey(name: 'feelslike_c')
  double? feelsLike;

  @JsonKey(name: 'vis_km')
  double? visKm;

  @JsonKey(name: 'uv')
  double? uv;

  @JsonKey(name: 'gust_kph')
  double? gustKph;

  CurrentWeather({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.temperature,
    this.condition,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.humidity,
    this.cloud,
    this.feelsLike,
    this.visKm,
    this.uv,
    this.gustKph});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class Forecast{
  @JsonKey(name: 'forecastday')
  List<ForecastDay>? forecastDays;

  Forecast({this.forecastDays});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class ForecastDay{
  @JsonKey(name: 'date')
  String? date;

  @JsonKey(name: 'date_epoch')
  int? dateEpoch;

  @JsonKey(name: 'day')
  Day? day;

  @JsonKey(name: 'astro')
  Astro? astro;

  @JsonKey(name: 'hour')
  List<Hour>? hour;

  ForecastDay({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}

@JsonSerializable()
class Day{
  @JsonKey(name: 'maxtemp_c')
  double? maxTemp;

  @JsonKey(name: 'mintemp_c')
  double? minTemp;

  @JsonKey(name: 'avgtemp_c')
  double? avgTemp;

  @JsonKey(name: 'maxwind_kph')
  double? maxWind;

  @JsonKey(name: 'totalprecip_mm')
  double? totalPrecip;

  @JsonKey(name: 'totalsnow_cm')
  double? totalSnow;

  @JsonKey(name: 'avgvis_km')
  double? avgVis;

  @JsonKey(name: 'avghumidity')
  double? avgHumidity;

  @JsonKey(name: 'daily_chance_of_rain')
  int? dailyChanceOfRain;

  @JsonKey(name: 'daily_chance_of_snow')
  int? dailyChanceOfSnow;

  @JsonKey(name: 'condition')
  Condition? condition;

  @JsonKey(name: 'uv')
  double? uv;

  Day({
    this.maxTemp,
    this.minTemp,
    this.avgTemp,
    this.maxWind,
    this.totalPrecip,
    this.totalSnow,
    this.avgVis,
    this.avgHumidity,
    this.dailyChanceOfRain,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv});

  factory Day.fromJson(Map<String, dynamic> json) =>
      _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}

@JsonSerializable()
class Astro{
  @JsonKey(name: 'sunrise')
  String? sunrise;

  @JsonKey(name: 'sunset')
  String? sunset;

  @JsonKey(name: 'moonrise')
  String? moonRise;

  @JsonKey(name: 'moonset')
  String? moonSet;

  @JsonKey(name: 'moon_phase')
  String? moonPhase;

  @JsonKey(name: 'moon_illumination')
  String? moonIllumination;

  @JsonKey(name: 'is_moon_up')
  int? isMoonUp;

  @JsonKey(name: 'is_sun_up')
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonRise,
    this.moonSet,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp});

  factory Astro.fromJson(Map<String, dynamic> json) =>
      _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);
}

@JsonSerializable()
class Hour{
  @JsonKey(name: 'time_epoch')
  int? timeEpoch;

  @JsonKey(name: 'time')
  String? time;

  @JsonKey(name: 'temp_c')
  double? temperature;

  @JsonKey(name: 'is_day')
  int? isDay;

  @JsonKey(name: 'condition')
  Condition? condition;

  @JsonKey(name: 'wind_kph')
  double? windKph;

  @JsonKey(name: 'wind_degree')
  int? windDegree;

  @JsonKey(name: 'wind_dir')
  String? windDir;

  @JsonKey(name: 'pressure_mb')
  double? pressureMb;

  @JsonKey(name: 'pressure_in')
  double? pressureIn;

  @JsonKey(name: 'humidity')
  int? humidity;

  @JsonKey(name: 'cloud')
  int? cloud;

  @JsonKey(name: 'feelslike_c')
  double? feelsLike;

  @JsonKey(name: 'windchill_c')
  double? windChill;

  @JsonKey(name: 'heatindex_c')
  double? heatIndex;

  @JsonKey(name: 'dewpoint_c')
  double? dewPoint;

  @JsonKey(name: 'chance_of_rain')
  int? chanceOfRain;

  @JsonKey(name: 'chance_of_snow')
  int? chanceOfSnow;

  @JsonKey(name: 'vis_km')
  double? visKm;

  @JsonKey(name: 'uv')
  double? uv;

  @JsonKey(name: 'gust_kph')
  double? gustKph;

  Hour({
    this.timeEpoch,
    this.time,
    this.temperature,
    this.isDay,
    this.condition,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.humidity,
    this.cloud,
    this.feelsLike,
    this.windChill,
    this.heatIndex,
    this.dewPoint,
    this.chanceOfRain,
    this.chanceOfSnow,
    this.visKm,
    this.uv,
    this.gustKph});

  factory Hour.fromJson(Map<String, dynamic> json) =>
      _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}

@JsonSerializable()
class Condition{
  @JsonKey(name: 'text')
  String? name;

  @JsonKey(name: 'icon')
  String? icon;

  @JsonKey(name: 'code')
  int? code;

  Condition({this.name, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}