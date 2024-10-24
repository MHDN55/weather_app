import 'package:equatable/equatable.dart';

class Sys extends Equatable {
  final String country;
  const Sys({
    required this.country,
  });

  @override
  List<Object?> get props => [country];
}
