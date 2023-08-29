import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_by_gps_test/core/error/failure.dart';
import 'package:weather_by_gps_test/core/usecases/usecase.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/current_temp_entity.dart';
import 'package:weather_by_gps_test/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentTemp extends UseCase<CurrentTempEntity, GetCurrentTempParams> {
  final WeatherRepository weatherRepository;

  GetCurrentTemp({required this.weatherRepository});

  @override
  Future<Either<Failure, CurrentTempEntity>> call(GetCurrentTempParams params) async {
    return await weatherRepository.getCurrentTemp();
  }
}

class GetCurrentTempParams extends Equatable {
  final String latitude, longitude;

  const GetCurrentTempParams({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
