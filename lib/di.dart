import 'package:core/core.dart';
import 'package:core/di.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:general_weather/di.module.dart';

import 'di.config.dart';

final GetIt diContainer = GetIt.instance;

@InjectableInit(externalPackageModulesBefore: [
  ExternalModule(CorePackageModule),
], externalPackageModulesAfter: [
  ExternalModule(GeneralWeatherPackageModule),
])
Future<void> configureDependencies() async {
  di = diContainer;
  await di.init();
}
