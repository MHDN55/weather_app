// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:weather_clean/core/error/exceptions.dart';
import 'package:weather_clean/core/error/failures.dart';
import 'package:weather_clean/core/network/network_info.dart';
import 'package:weather_clean/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_clean/features/weather/domain/entities/weather_father.dart';
import 'package:weather_clean/features/weather/domain/repositories/weather_repositories.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoriesImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoriesImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure,WeatherFather>> getWeather() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await remoteDataSource.getWeather();
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
