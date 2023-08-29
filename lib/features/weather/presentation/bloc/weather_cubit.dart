import 'package:flutter_bloc/flutter_bloc.dart';
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

    final getCurrentTempOrFailure = await getCurrentTemp.call(const GetCurrentTempParams(latitude: '', longitude: ''));
    final getFutureTempOrFailure = await getFutureTemp.call(const GetFutureTempParams(latitude: '', longitude: ''));

    getCurrentTempOrFailure.fold((error) => emit(const WeatherError()), (currentTemp) {
      getFutureTempOrFailure.fold(
        (error) => emit(const WeatherError()),
        (futureTempList) => (emit(WeatherLoaded(currentTempEntity: currentTemp, futureTempEntityList: futureTempList))),
      );
    });
  }
}
