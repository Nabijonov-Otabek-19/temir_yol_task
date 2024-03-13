import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:temir_yol_task/core/error/failures.dart';
import 'package:temir_yol_task/core/usecase/usecase.dart';
import 'package:temir_yol_task/features/domain/entity/weather_entity.dart';
import 'package:temir_yol_task/features/domain/repository/repository.dart';

class GetCurrentWeatherUseCase implements UseCase<WeatherEntity, Params> {
  final Repository repository;

  GetCurrentWeatherUseCase({required this.repository});

  @override
  Future<Either<Failure, WeatherEntity>> call(Params params) async {
    return await repository.getCurrentWeatherData(params.city);
  }
}

class Params extends Equatable {
  final String city;

  const Params({required this.city});

  @override
  List<Object> get props => [city];
}
