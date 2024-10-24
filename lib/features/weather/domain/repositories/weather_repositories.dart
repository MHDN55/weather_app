import 'package:weather_clean/core/error/failures.dart';
import 'package:weather_clean/features/weather/domain/entities/weather_father.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository{
    Future<Either<Failure, WeatherFather>> getWeather();
}