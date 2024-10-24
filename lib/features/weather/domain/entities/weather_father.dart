import 'package:equatable/equatable.dart';

import 'package:weather_clean/features/weather/data/models/coord_model.dart';
import 'package:weather_clean/features/weather/data/models/mymain_model.dart';
import 'package:weather_clean/features/weather/data/models/sys_model.dart';
import 'package:weather_clean/features/weather/data/models/weather_model.dart';

class WeatherFather extends Equatable {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final MyMainModel main;
  final SysModel sys;
  const WeatherFather({
    required this.coord,
    required this.weather,
    required this.main,
    required this.sys,
  });

  @override
  List<Object?> get props => [coord, weather, main, sys];
}
