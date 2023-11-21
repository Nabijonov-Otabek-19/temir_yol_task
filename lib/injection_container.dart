import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:temir_yol_task/features/domain/usecase/get_current_weather.dart';
import 'package:temir_yol_task/features/presentation/screen/home/bloc/home_bloc.dart';

import 'core/network/base_api.dart';
import 'features/data/datasources/remote_data_source.dart';
import 'features/data/repository/repository_impl.dart';
import 'features/domain/repository/repository.dart';

final GetIt di = GetIt.instance;

Future<void> init() async {
  // BaseApi
  di.registerLazySingleton<BaseApi>(() => BaseApi());

  //Dio
  di.registerLazySingleton<Dio>(() => di.get<BaseApi>().dio);

  // Use cases
  di.registerLazySingleton(() => GetCurrentWeatherUseCase(repository: di()));

  // Bloc
  di.registerLazySingleton(() => HomeBloc(getCurrentWeatherUsecase: di()));

  // Repository
  di.registerLazySingleton<Repository>(
    () => RepositoryImpl(remoteDataSource: di()),
  );

  // Data sources
  di.registerLazySingleton(() => RemoteDataSourceImpl(dio: di()));
}
