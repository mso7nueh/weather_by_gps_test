import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_by_gps_test/core/error/failure.dart';
import 'package:weather_by_gps_test/core/usecases/usecase.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/future_temp_entity.dart';
import 'package:weather_by_gps_test/features/weather/domain/repositories/weather_repository.dart';

class GetFutureTemp extends UseCase<List<FutureTempEntity>, GetFutureTempParams> {
  final WeatherRepository weatherRepository;

  GetFutureTemp({required this.weatherRepository});

  @override
  Future<Either<Failure, List<FutureTempEntity>>> call(GetFutureTempParams params) async {
    return await weatherRepository.getFutureTemp(params.latitude, params.longitude);
  }
}

class GetFutureTempParams extends Equatable {
  final String latitude, longitude;

  const GetFutureTempParams({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
