// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mymain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyMainModel _$MyMainModelFromJson(Map<String, dynamic> json) => MyMainModel(
      temp_min: (json['temp_min'] as num).toDouble(),
      temp_max: (json['temp_max'] as num).toDouble(),
      temp: (json['temp'] as num).toDouble(),
    );

Map<String, dynamic> _$MyMainModelToJson(MyMainModel instance) =>
    <String, dynamic>{
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'temp': instance.temp,
    };
