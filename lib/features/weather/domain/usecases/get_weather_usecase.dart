import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_clean/core/error/failures.dart';
import 'package:weather_clean/features/weather/domain/entities/weather_father.dart';
import 'package:weather_clean/features/weather/domain/repositories/weather_repositories.dart';

@lazySingleton
class GetWeatherUsecase {
  final WeatherRepository repository;
  GetWeatherUsecase(this.repository);

  Future<Either<Failure,WeatherFather>> call()async{
    return await repository.getWeather();
  }
}
