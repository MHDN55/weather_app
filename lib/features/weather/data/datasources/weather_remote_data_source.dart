import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_clean/core/error/exceptions.dart';

import 'package:weather_clean/features/weather/data/models/weather_father_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherFatherModel> getWeather();
}

const apiKey = "2bb4b3933e5b7bb43d22c5fc7a5285bb";

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherFatherModel> getWeather() async {
    try {
      LocationPermission permission;

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition();

      final response = await client.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        print('======================================${response.body}');

        final decodedJson = jsonDecode(response.body);

        final WeatherFatherModel weatherFatherModels =
            WeatherFatherModel.fromJson(decodedJson);

        return weatherFatherModels;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
