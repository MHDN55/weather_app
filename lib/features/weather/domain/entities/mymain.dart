// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class MyMain extends Equatable {
  final double temp_min;
  final double temp_max;
  final double temp;
  const MyMain({
    required this.temp_min,
    required this.temp_max,
    required this.temp,
  });

  @override
  List<Object?> get props => [temp_max, temp_min, temp];
}
