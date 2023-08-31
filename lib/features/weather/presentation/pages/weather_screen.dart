import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_by_gps_test/common/app_colors.dart';
import 'package:weather_by_gps_test/common/app_text_styles.dart';
import 'package:weather_by_gps_test/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:weather_by_gps_test/features/weather/presentation/bloc/weather_state.dart';
import 'package:weather_by_gps_test/features/weather/presentation/widgets/current_mode_image_widget.dart';
import 'package:weather_by_gps_test/features/weather/presentation/widgets/future_temp_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.gradientStart,
                    AppColors.gradientEnd,
                  ],
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/pin.svg'),
                          const SizedBox(width: 8.0),
                          Text(
                            state.currentTempEntity.cityName,
                            style: AppTextStyles.b2Medium(
                              Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.violet,
                                  blurRadius: 80,
                                ),
                              ],
                            ),
                          ),
                          CurrentModeImageWidget(mode: state.currentTempEntity.mode),
                        ],
                      ),
                      Text(
                        '${double.parse(state.currentTempEntity.temp).toStringAsFixed(0)}º',
                        style: const TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 64,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Макс: ${double.parse(state.currentTempEntity.max).toStringAsFixed(0)}º Мин: ${double.parse(state.currentTempEntity.min).toStringAsFixed(0)}º',
                        style: AppTextStyles.b1(
                          Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Сегодня',
                              style: AppTextStyles.b1Medium(Colors.white),
                            ),
                            Text(
                              DateFormat('dd MMMM', 'ru_RU').format(DateTime.now()),
                              style: AppTextStyles.b2(Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                        color: Colors.white,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 4; i++) ...[
                              FutureTempWidget(
                                  time: state.futureTempEntityList[i].date, mode: state.futureTempEntityList[i].mode, temp: state.futureTempEntityList[i].temp)
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/wind.svg'),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '${double.parse(state.currentTempEntity.windSpeed).toStringAsFixed(1)} м/c',
                                      style: AppTextStyles.b2Medium(Colors.white24),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/drop.svg'),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '${double.parse(state.currentTempEntity.humidity).toStringAsFixed(0)}%',
                                      style: AppTextStyles.b2Medium(Colors.white24),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
