import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_weather/data/data_sources/data_sources.dart';
import 'package:general_weather/data/implemented_repositories/implemented_repositories.dart';
import 'package:general_weather/domain/domain.dart';
import 'package:general_weather/presentation/logic/fetch_weather_cubit/fetch_weather_cubit.dart';
import 'package:general_weather/presentation/ui/ui.dart';

import 'di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<FetchWeatherCubit>(
        create: (blocContext) => FetchWeatherCubit(
            FetchWeatherUseCase(WeatherRepositoryImpl(WeatherApi())))
          ..initialize(),
        child: const GeneralWeatherScreen(),
      ),
    );
  }
}
