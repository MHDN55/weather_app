import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean/features/weather/domain/entities/sys.dart';

part 'sys_model.g.dart';

@JsonSerializable()
class SysModel extends Sys {
  const SysModel({
    required super.country,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) => _$SysModelFromJson(json);

  Map<String, dynamic> toJson() => _$SysModelToJson(this);
}
