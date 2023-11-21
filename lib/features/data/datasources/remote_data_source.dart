import '../model/weather_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String city);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  const RemoteDataSourceImpl({required this.dio});

  @override
  Future<WeatherModel> getCurrentWeather(String city) async {
    WeatherModel weatherModel;

    try {
      final response = await dio.get(
        "current.json",
        queryParameters: {'q': city},
      );

      weatherModel = WeatherModel.fromJson(response.data);
    } catch (e) {
      print("Exception: $e");
      throw Exception("Server error = $e");
    }

    return weatherModel;
  }
}
