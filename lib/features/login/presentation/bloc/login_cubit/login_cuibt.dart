import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_by_gps_test/features/login/domain/usecases/login.dart';
import 'package:weather_by_gps_test/features/login/presentation/bloc/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Login login;

  LoginCubit({required this.login}) : super(const LoginEmpty());

  Future<void> tryLogin(String email, String password) async {
    final resultOrFailure = await login.call(LoginParams(email: email, password: password));
    resultOrFailure.fold((error) => emit(const LoginError()), (result) => result ? emit(const LoginSuccess()) : emit(const LoginError()));
  }
}
