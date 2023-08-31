import 'package:go_router/go_router.dart';
import 'package:weather_by_gps_test/features/login/presentation/pages/login_screen.dart';
import 'package:weather_by_gps_test/features/weather/presentation/pages/weather_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/login-screen',
    routes: [
      GoRoute(
        name: 'loginScreen',
        path: '/login-screen',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'weatherScreen',
        path: '/weather-screen',
        builder: (context, state) => const WeatherScreen(),
      ),
    ],
  );
}
