import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_by_gps_test/features/login/presentation/bloc/login_cubit/login_cuibt.dart';
import 'package:weather_by_gps_test/features/login/presentation/bloc/login_cubit/login_state.dart';
import 'package:weather_by_gps_test/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          Future.delayed(Duration.zero, () => context.goNamed('weatherScreen'));
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
              ),
              TextFormField(
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () => context.read<LoginCubit>().tryLogin(_emailController.text.toString().trim(), _passwordController.text.toString().trim()),
                child: Text(s.enter),
              ),
            ],
          ),
        );
      },
    );
  }
}
