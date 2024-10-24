part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class LoadingWeatherState extends WeatherState {}

final class LoadedWeatherState extends WeatherState {
  final WeatherFather weather;

  const LoadedWeatherState({required this.weather});
  @override
  List<Object> get props => [weather];
}

final class ErrorWeatherState extends WeatherState {
  final String message;

  const ErrorWeatherState({required this.message});
  @override
  List<Object> get props => [message];
}
