import 'package:dartz/dartz.dart';
import 'package:weather_by_gps_test/core/error/exception.dart';
import 'package:weather_by_gps_test/core/error/failure.dart';
import 'package:weather_by_gps_test/core/platform/network_info.dart';
import 'package:weather_by_gps_test/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_by_gps_test/features/weather/data/datasources/weather_remote_data_soruce.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/current_temp_entity.dart';
import 'package:weather_by_gps_test/features/weather/domain/entities/future_temp_entity.dart';
import 'package:weather_by_gps_test/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, CurrentTempEntity>> getCurrentTemp(String latitude, String longitude) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCurrentTemp = await remoteDataSource.getCurrentTemp(latitude, longitude);
        await localDataSource.saveCurrentTempToCache(remoteCurrentTemp);
        return Right(remoteCurrentTemp);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCurrentTemp = await localDataSource.getCurrentTempFromCache();
        return Right(localCurrentTemp);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<FutureTempEntity>>> getFutureTemp(String latitude, String longitude) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFutureTemp = await remoteDataSource.getFutureTemp(latitude, longitude);
        await localDataSource.saveFutureTempToCache(remoteFutureTemp);
        return Right(remoteFutureTemp);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFutureTemp = await localDataSource.getFutureTempFromCache();
        return Right(localFutureTemp);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
