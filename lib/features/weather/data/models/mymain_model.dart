// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean/features/weather/domain/entities/mymain.dart';

part 'mymain_model.g.dart';

@JsonSerializable()
class MyMainModel extends MyMain {
  const MyMainModel({
    required super.temp_min,
    required super.temp_max,
    required super.temp,
  });
  
  factory MyMainModel.fromJson(Map<String, dynamic> json) => _$MyMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyMainModelToJson(this);
}
