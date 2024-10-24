// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_father_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherFatherModel _$WeatherFatherModelFromJson(Map<String, dynamic> json) =>
    WeatherFatherModel(
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: MyMainModel.fromJson(json['main'] as Map<String, dynamic>),
      sys: SysModel.fromJson(json['sys'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherFatherModelToJson(WeatherFatherModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'main': instance.main,
      'sys': instance.sys,
    };
