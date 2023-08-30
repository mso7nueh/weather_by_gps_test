import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_by_gps_test/core/platform/gps.dart';
import 'package:weather_by_gps_test/features/weather/domain/usecases/get_current_temp.dart';
import 'package:weather_by_gps_test/features/weather/domain/usecases/get_future_temp.dart';
import 'package:weather_by_gps_test/features/weather/presentation/bloc/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentTemp getCurrentTemp;
  final GetFutureTemp getFutureTemp;
  final GPS gps;

  WeatherCubit({required this.getCurrentTemp, required this.getFutureTemp, required this.gps}) : super(const WeatherEmpty());

  Future<void> getWeather() async {
    emit(const WeatherLoading());

    final currentPosition = await gps.getCurrentPosition();

    final currentTempOrFailure = await getCurrentTemp.call(GetCurrentTempParams(latitude: currentPosition.latitude.toString(), longitude: currentPosition.longitude.toString()));
    final futureTempOrFailure = await getFutureTemp.call(GetFutureTempParams(latitude: currentPosition.latitude.toString(), longitude: currentPosition.longitude.toString()));

    currentTempOrFailure.fold((error) => emit(const WeatherError()), (currentTemp) {
      futureTempOrFailure.fold(
        (error) => emit(const WeatherError()),
        (futureTempList) => (emit(WeatherLoaded(currentTempEntity: currentTemp, futureTempEntityList: futureTempList))),
      );
    });
  }
}
