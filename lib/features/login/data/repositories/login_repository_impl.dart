import 'package:dartz/dartz.dart';
import 'package:weather_by_gps_test/core/error/exception.dart';
import 'package:weather_by_gps_test/core/error/failure.dart';
import 'package:weather_by_gps_test/core/platform/network_info.dart';
import 'package:weather_by_gps_test/features/login/data/datasources/login_remote_data_source.dart';
import 'package:weather_by_gps_test/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final bool result = await remoteDataSource.login(email, password);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
