import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temir_yol_task/features/data/loading_state_enum.dart';
import 'package:temir_yol_task/features/domain/entity/weather_data.dart';

import '../../../../../core/error/failures.dart';
import '../../../../domain/usecase/get_current_weather.dart';

part 'home_event.dart';

part 'home_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUsecase;

  HomeBloc({
    required this.getCurrentWeatherUsecase,
  }) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case GetCurrentWeatherEvent():
          emit(state.copyWith(status: LoadingState.LOADING));
          final result =
              await getCurrentWeatherUsecase(Params(city: event.city));
          _getCurrentWeather(state, emit, result);
          break;
      }
    });
  }

  void _getCurrentWeather(
    HomeState state,
    Emitter<HomeState> emit,
    Either<Failure, WeatherData> result,
  ) async {
    result.fold(
      (failure) async => emit(state.copyWith(
          status: LoadingState.ERROR,
          errorMessage: _mapFailureMessage(failure))),
      (success) async => emit(
          state.copyWith(status: LoadingState.LOADED, weatherData: success)),
    );
  }

  String _mapFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Aniqlanmagan Xatolik';
    }
  }
}
