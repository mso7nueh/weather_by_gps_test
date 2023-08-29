import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_by_gps_test/app_router.dart';
import 'package:weather_by_gps_test/features/login/presentation/bloc/login_cubit/login_cuibt.dart';
import 'package:weather_by_gps_test/generated/l10n.dart';
import 'package:weather_by_gps_test/locator_service.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_by_gps_test/locator_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => sl<LoginCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
