import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginEmpty extends LoginState {
  const LoginEmpty();

  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  const LoginSuccess();

  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  const LoginError();

  @override
  List<Object?> get props => [];
}
