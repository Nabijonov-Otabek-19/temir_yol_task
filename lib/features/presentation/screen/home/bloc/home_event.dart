part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCurrentWeatherEvent extends HomeEvent {
  final String city;

  GetCurrentWeatherEvent({required this.city});

  @override
  List<Object> get props => [city];
}
