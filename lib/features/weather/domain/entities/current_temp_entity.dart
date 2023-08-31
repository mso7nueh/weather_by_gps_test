import 'package:equatable/equatable.dart';

class CurrentTempEntity extends Equatable {
  final String cityName, temp, mode, max, min, windSpeed, humidity, description, deg;

  const CurrentTempEntity({
    required this.cityName,
    required this.temp,
    required this.mode,
    required this.max,
    required this.min,
    required this.windSpeed,
    required this.humidity,
    required this.description,
    required this.deg,
  });

  @override
  List<Object?> get props => [cityName, temp, mode, max, min, windSpeed, humidity, description, deg];
}
