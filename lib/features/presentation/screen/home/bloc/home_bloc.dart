import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:temir_yol_task/features/data/loading_state_enum.dart';
import 'package:temir_yol_task/features/domain/entity/weather_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../../../domain/usecase/get_current_weather.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  HomeBloc({
    required this.getCurrentWeatherUseCase,
  }) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case GetCurrentWeatherEvent():
          emit(state.copyWith(status: LoadingState.LOADING));
          final result =
              await getCurrentWeatherUseCase(Params(city: event.city));
          _getCurrentWeather(state, emit, result);
          break;
      }
    });
  }

  void _getCurrentWeather(
    HomeState state,
    Emitter<HomeState> emit,
    Either<Failure, WeatherEntity> result,
  ) async {
    result.fold(
      (failure) async => emit(state.copyWith(
        status: LoadingState.ERROR,
        errorMessage: failure.errorMessage,
      )),
      (success) async => emit(state.copyWith(
        status: LoadingState.LOADED,
        weatherData: success,
      )),
    );
  }
}
