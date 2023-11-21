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
          : LocationData.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentData.fromJson(json['current'] as Map<String, dynamic>),
    );
  }
}
