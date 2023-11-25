import '../../domain/entity/weather_data.dart';

class WeatherModel extends WeatherData {
  WeatherModel({
    required super.current,
    required super.location,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
    );
  }
}

class LocationModel extends LocationData {
  LocationModel({
    required super.name,
    required super.region,
    required super.country,
    required super.lat,
    required super.lon,
    required super.tzId,
    required super.localtimeEpoch,
    required super.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      lat: json['lat'] as double?,
      lon: json['lon'] as double?,
      tzId: json['tz_id'] as String?,
      localtimeEpoch: json['localtime_epoch'] as int?,
      localtime: json['localtime'] as String?,
    );
  }
}

class CurrentModel extends CurrentData {
  CurrentModel({
    required super.lastUpdatedEpoch,
    required super.lastUpdated,
    required super.tempC,
    required super.tempF,
    required super.isDay,
    required super.condition,
    required super.windMph,
    required super.windKph,
    required super.windDegree,
    required super.windDir,
    required super.pressureMb,
    required super.pressureIn,
    required super.precipMm,
    required super.precipIn,
    required super.humidity,
    required super.cloud,
    required super.feelslikeC,
    required super.feelslikeF,
    required super.visKm,
    required super.visMiles,
    required super.uv,
    required super.gustMph,
    required super.gustKph,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      lastUpdatedEpoch: json['last_updated_epoch'] as int?,
      lastUpdated: json['last_updated'] as String?,
      tempC: json['temp_c'] as double?,
      tempF: json['temp_f'] as double?,
      isDay: json['is_day'] as int?,
      condition: json['condition'] == null
          ? null
          : ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: json['wind_mph'] as double?,
      windKph: json['wind_kph'] as double?,
      windDegree: json['wind_degree'] as int?,
      windDir: json['wind_dir'] as String?,
      pressureMb: json['pressure_mb'] as double?,
      pressureIn: json['pressure_in'] as double?,
      precipMm: json['precip_mm'] as double?,
      precipIn: json['precip_in'] as double?,
      humidity: json['humidity'] as int?,
      cloud: json['cloud'] as int?,
      feelslikeC: json['feelslike_c'] as double?,
      feelslikeF: json['feelslike_f'] as double?,
      visKm: json['vis_km'] as double?,
      visMiles: json['vis_miles'] as double?,
      uv: json['uv'] as double?,
      gustMph: json['gust_mph'] as double?,
      gustKph: json['gust_kph'] as double?,
    );
  }
}

class ConditionModel extends ConditionData {
  ConditionModel({
    required super.text,
    required super.icon,
    required super.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as int?,
    );
  }
}
