import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_by_gps_test/common/app_colors.dart';
import 'package:weather_by_gps_test/common/app_text_styles.dart';
import 'package:weather_by_gps_test/features/login/presentation/bloc/login_cubit/login_cuibt.dart';
import 'package:weather_by_gps_test/features/login/presentation/bloc/login_cubit/login_state.dart';
import 'package:weather_by_gps_test/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordHide = true;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          Future.delayed(Duration.zero, () => context.goNamed('weatherScreen'));
        }
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.entrance,
                  style: AppTextStyles.h1(
                    AppColors.header,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  s.inputDataForLogin,
                  style: AppTextStyles.b2(
                    AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  style: AppTextStyles.b1(AppColors.header),
                  cursorColor: AppColors.red,
                  decoration: InputDecoration(
                    labelText: s.email,
                    labelStyle: AppTextStyles.b1(AppColors.greyText),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.stroke,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isPasswordHide ? true : false,
                  cursorColor: AppColors.red,
                  style: AppTextStyles.b1(AppColors.header),
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.stroke,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.blue,
                        width: 2.0,
                      ),
                    ),
                    labelStyle: AppTextStyles.b1(AppColors.greyText),
                    suffixIcon: IconButton(
                      icon: AnimatedCrossFade(
                        firstChild: SvgPicture.asset('assets/icons/eye.svg'),
                        secondChild: SvgPicture.asset('assets/icons/eye-off.svg'),
                        crossFadeState: isPasswordHide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 200),
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordHide = !isPasswordHide;
                        });
                      },
                    ),
                    labelText: s.password,
                  ),
                ),
                const SizedBox(height: 24.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 32.0,
                        offset: Offset(0, 8.0),
                        color: AppColors.redShadow,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => context.read<LoginCubit>().tryLogin(_emailController.text.toString().trim(), _passwordController.text.toString().trim()),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.blue,
                      ),
                      shadowColor: MaterialStateProperty.all(const Color(0x00ffffff)),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      alignment: Alignment.center,
                      child: Text(
                        s.enter,
                        style: AppTextStyles.b1Medium(Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
