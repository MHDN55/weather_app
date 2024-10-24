import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean/features/weather/domain/entities/coord.dart';

part 'coord_model.g.dart';

@JsonSerializable()
class CoordModel extends Coord {
  
  const CoordModel({
    required super.lon,
    required super.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) => _$CoordModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordModelToJson(this);
}
