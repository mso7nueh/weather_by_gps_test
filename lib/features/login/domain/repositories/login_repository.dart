import 'package:dartz/dartz.dart';
import 'package:weather_by_gps_test/core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> login(String email, String password);
}