import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_by_gps_test/core/error/failure.dart';
import 'package:weather_by_gps_test/core/usecases/usecase.dart';
import 'package:weather_by_gps_test/features/login/domain/repositories/login_repository.dart';

class Login extends UseCase<bool, LoginParams> {
  final LoginRepository loginRepository;

  Login({required this.loginRepository});

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async {
    return await loginRepository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email, password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
