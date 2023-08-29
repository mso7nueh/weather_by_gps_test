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

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(() => LoginCubit(login: sl()));

  // UseCases
  sl.registerLazySingleton<Login>(() => Login(loginRepository: sl()));

  // Repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<GPS>(() => GPSImpl());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}