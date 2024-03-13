import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:temir_yol_task/core/error/failures.dart';
import 'package:temir_yol_task/features/data/datasources/remote_data_source.dart';

import '../../../core/network/network_status.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSourceImpl remoteDataSource;
  final NetworkStatus networkStatus;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkStatus,
  });

  final connectivityResult = (Connectivity().checkConnectivity());

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherData(
      String city) async {
    try {
      final status = await networkStatus.getNetworkStatus();
      if (status == ConnectivityResult.mobile ||
          status == ConnectivityResult.wifi) {
        final remote = await remoteDataSource.getCurrentWeather(city);
        return Right(remote);
      } else {
        return const Left(Failure(errorMessage: "Check Internet connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
