part of 'home_bloc.dart';

@immutable
class HomeState {
  final LoadingState status;
  final WeatherEntity? weatherData;
  final String errorMessage;

  const HomeState({
    this.status = LoadingState.EMPTY,
    this.errorMessage = "",
    this.weatherData,
  });

  HomeState copyWith({
    LoadingState? status,
    WeatherEntity? weatherData,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      weatherData: weatherData ?? this.weatherData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
