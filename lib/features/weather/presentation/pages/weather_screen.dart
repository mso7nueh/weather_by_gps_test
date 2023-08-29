import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_by_gps_test/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:weather_by_gps_test/features/weather/presentation/bloc/weather_state.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              final completer = Completer();
              return completer.future;
            },
            child: Center(child: Text('Погода')),
          ),
        );
      },
    );
  }
}
