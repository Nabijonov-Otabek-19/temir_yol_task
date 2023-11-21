import 'package:dartz/dartz.dart';
import 'package:temir_yol_task/core/error/failures.dart';

import '../entity/weather_data.dart';

abstract class Repository {
  Future<Either<Failure, WeatherData>> getCurrentWeatherData(String city);
}
