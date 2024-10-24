import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean/features/weather/data/models/coord_model.dart';
import 'package:weather_clean/features/weather/data/models/mymain_model.dart';
import 'package:weather_clean/features/weather/data/models/sys_model.dart';
import 'package:weather_clean/features/weather/data/models/weather_model.dart';
import 'package:weather_clean/features/weather/domain/entities/weather_father.dart';

part 'weather_father_model.g.dart';

@JsonSerializable()
class WeatherFatherModel extends WeatherFather {
  const WeatherFatherModel({
    required super.coord,
    required super.weather,
    required super.main,
    required super.sys,
  });

  factory WeatherFatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherFatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherFatherModelToJson(this);
}
