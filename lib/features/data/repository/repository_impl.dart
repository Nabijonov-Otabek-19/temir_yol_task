import 'package:dartz/dartz.dart';
import 'package:temir_yol_task/core/error/failures.dart';
import 'package:temir_yol_task/features/data/datasources/remote_data_source.dart';

import '../../domain/entity/weather_data.dart';
import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSourceImpl remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherData>> getCurrentWeatherData(
      String city) async {
    try {
      final remote = await remoteDataSource.getCurrentWeather(city);
      return Right(remote);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
