//@GeneratedMicroModule;GeneralWeatherPackageModule;package:general_weather/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:general_weather/data/data_sources/data_sources.dart' as _i6;
import 'package:general_weather/data/data_sources/weather_api.dart' as _i3;
import 'package:general_weather/data/implemented_repositories/open_weather_repository_implementation.dart'
    as _i5;
import 'package:general_weather/domain/domain.dart' as _i9;
import 'package:general_weather/domain/repositories/weather_repository.dart'
    as _i4;
import 'package:general_weather/domain/usecases/fetch_weather_usecase.dart'
    as _i7;
import 'package:general_weather/presentation/logic/fetch_weather_cubit/fetch_weather_cubit.dart'
    as _i8;
import 'package:injectable/injectable.dart' as _i1;

class GeneralWeatherPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.lazySingleton<_i3.WeatherApi>(() => _i3.WeatherApi());
    gh.lazySingleton<_i4.WeatherRepository>(
        () => _i5.WeatherRepositoryImpl(gh<_i6.WeatherApi>()));
    gh.factory<_i7.FetchWeatherUseCase>(
        () => _i7.FetchWeatherUseCase(gh<_i4.WeatherRepository>()));
    gh.factory<_i8.FetchWeatherCubit>(
        () => _i8.FetchWeatherCubit(gh<_i9.FetchWeatherUseCase>()));
  }
}
