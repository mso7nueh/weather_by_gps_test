import 'package:dartz/dartz.dart';
import 'package:weather_by_gps_test/core/error/failure.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/current_temp_entity.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/future_temp_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentTempEntity>> getCurrentTemp();

  Future<Either<Failure, List<FutureTempEntity>>> getFutureTemp();
}
