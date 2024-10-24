import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:weather_clean/core/Strings/failures.dart';
import 'package:weather_clean/core/error/failures.dart';
import 'package:weather_clean/features/weather/domain/entities/weather_father.dart';
import 'package:weather_clean/features/weather/domain/usecases/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@lazySingleton
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUsecase getWeather;
  WeatherBloc({
    required this.getWeather,
  }) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeatherEvent) {
        emit(LoadingWeatherState());

        final failureOrWeather = await getWeather();
        emit(_mapFailureOrPostsToState(failureOrWeather));
      } else if (event is RefreshWeatherEvent) {
        emit(LoadingWeatherState());

        final failureOrWeather = await getWeather();
        emit(_mapFailureOrPostsToState(failureOrWeather));
      }
    });
  }

  WeatherState _mapFailureOrPostsToState(Either<Failure, WeatherFather> either) {
    return either.fold(
      (failure) => ErrorWeatherState(message: _mapFailureToMessage(failure)),
      (weather) => LoadedWeatherState(weather: weather),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , please tey again later .";
    }
  }
}
