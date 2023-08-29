import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_by_gps_test/core/platform/gps.dart';
import 'package:weather_by_gps_test/core/platform/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:weather_by_gps_test/features/login/data/datasources/login_remote_data_source.dart';
import 'package:weather_by_gps_test/features/login/data/repositories/login_repository_impl.dart';
import 'package:weather_by_gps_test/features/login/domain/repositories/login_repository.dart';
import 'package:weather_by_gps_test/features/login/domain/usecases/login.dart';
import 'package:weather_by_gps_test/features/login/presentation/bloc/login_cubit/login_cuibt.dart';
import 'package:weather_by_gps_test/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_by_gps_test/features/weather/data/datasources/weather_remote_data_soruce.dart';
import 'package:weather_by_gps_test/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_by_gps_test/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_by_gps_test/features/weather/domain/usecases/get_current_temp.dart';
import 'package:weather_by_gps_test/features/weather/domain/usecases/get_future_temp.dart';
import 'package:weather_by_gps_test/features/weather/presentation/bloc/weather_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(() => LoginCubit(login: sl()));
  sl.registerFactory(() => WeatherCubit(getCurrentTemp: sl(), getFutureTemp: sl(), gps: sl()));

  // UseCases
  sl.registerLazySingleton<Login>(() => Login(loginRepository: sl()));

  sl.registerLazySingleton<GetCurrentTemp>(() => GetCurrentTemp(weatherRepository: sl()));
  sl.registerLazySingleton<GetFutureTemp>(() => GetFutureTemp(weatherRepository: sl()));

  // Repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<WeatherLocalDataSource>(() => WeatherLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<GPS>(() => GPSImpl());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
