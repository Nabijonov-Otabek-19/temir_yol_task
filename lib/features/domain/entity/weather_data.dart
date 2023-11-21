class WeatherData {
  LocationData? location;
  CurrentData? current;

  WeatherData({
    this.location,
    this.current,
  });
}

class LocationData {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  LocationData({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
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

class CurrentData {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  ConditionData? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  CurrentData({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory CurrentData.fromJson(Map<String, dynamic> json) {
    return CurrentData(
      lastUpdatedEpoch: json['last_updated_epoch'] as int?,
      lastUpdated: json['last_updated'] as String?,
      tempC: json['temp_c'] as double?,
      tempF: json['temp_f'] as double?,
      isDay: json['is_day'] as int?,
      condition: json['condition'] == null
          ? null
          : ConditionData.fromJson(json['condition'] as Map<String, dynamic>),
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

class ConditionData {
  String? text;
  String? icon;
  int? code;

  ConditionData({
    this.text,
    this.icon,
    this.code,
  });

  factory ConditionData.fromJson(Map<String, dynamic> json) {
    return ConditionData(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as int?,
    );
  }
}
