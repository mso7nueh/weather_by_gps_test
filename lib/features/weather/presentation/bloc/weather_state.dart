import 'package:equatable/equatable.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/current_temp_entity.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/future_temp_entity.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends WeatherState {
  const WeatherEmpty();

  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();

  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  final CurrentTempEntity currentTempEntity;
  final List<FutureTempEntity> futureTempEntityList;

  const WeatherLoaded({required this.currentTempEntity, required this.futureTempEntityList});

  @override
  List<Object?> get props => [currentTempEntity, futureTempEntityList];
}


class WeatherError extends WeatherState {
  const WeatherError();

  @override
  List<Object?> get props => [];
}
