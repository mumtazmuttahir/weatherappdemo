import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_weather/configs/configs.dart';
import 'package:general_weather/domain/domain.dart';
import 'package:general_weather/presentation/logic/fetch_weather_cubit/fetch_weather_cubit.dart';
import 'package:general_weather/presentation/presentation.dart';
import 'package:shared_design_components/colors/colors.dart';
import 'package:shared_design_components/constants/constants.dart';
import 'package:shared_design_components/textstyles/organization_textstyles.dart';

part 'components/a_day_date_section.dart';
part 'components/b_select_city.dart';
part 'components/c_weather_summary.dart';
part 'components/d_measurement_section.dart';
part 'components/e_forcast_section.dart';

class GeneralWeatherScreen extends StatefulWidget {
  const GeneralWeatherScreen({super.key});

  @override
  State<GeneralWeatherScreen> createState() => _GeneralWeatherScreenState();
}

class _GeneralWeatherScreenState extends State<GeneralWeatherScreen> {
  Timer? timer;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(milliseconds: 60000),
        (Timer t) => setState(() {
              counter++;
              if (counter > 4) {
                counter = 0;
              }
              context.read<FetchWeatherCubit>().fetchNewCity(counter);
            }));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> _refreshData() async {
    context.read<FetchWeatherCubit>().refrestWeather();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchWeatherCubit, FetchWeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 96.0, bottom: 64),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (state.status == WeatherStatus.loading) ...[
                      DayDateSection(
                        day: state.weekDay,
                        date: state.dateToday,
                      ),
                      const VerticalSpace(spaceLength: Spacing.space24),
                      SelectCitySection(cityName: state.cityName),
                      const VerticalSpace(spaceLength: Spacing.space32),
                      WeatherSummary(
                        temparature: state.temparature,
                        weatherCondition: state.weather,
                      ),
                      const VerticalSpace(spaceLength: Spacing.space32),
                      const Divider(),
                      const VerticalSpace(spaceLength: Spacing.space24),
                      MeasurementSection(
                        humidty: state.humidity.toDouble(),
                        pressure: state.pressure.toDouble(),
                        wind: state.wind,
                      ),
                      const VerticalSpace(spaceLength: Spacing.space24),
                      const Divider(),
                      const VerticalSpace(spaceLength: Spacing.space32),
                      ForecastSection(forecastList: state.forcastList),
                    ],
                    if (state.status == WeatherStatus.loaded) ...[
                      DayDateSection(
                        day: state.weekDay,
                        date: state.dateToday,
                      ),
                      const VerticalSpace(spaceLength: Spacing.space24),
                      SelectCitySection(cityName: state.cityName),
                      const VerticalSpace(spaceLength: Spacing.space32),
                      WeatherSummary(
                        temparature: state.temparature,
                        weatherCondition: state.weather,
                      ),
                      const VerticalSpace(spaceLength: Spacing.space32),
                      const Divider(),
                      const VerticalSpace(spaceLength: Spacing.space24),
                      MeasurementSection(
                        humidty: state.humidity.toDouble(),
                        pressure: state.pressure.toDouble(),
                        wind: state.wind,
                      ),
                      const VerticalSpace(spaceLength: Spacing.space24),
                      const Divider(),
                      const VerticalSpace(spaceLength: Spacing.space32),
                      ForecastSection(forecastList: state.forcastList),
                    ],
                    if (state.status == WeatherStatus.refreshing) ...[
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                    if (state.status == WeatherStatus.error) ...[
                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              context.read<FetchWeatherCubit>().initialize();
                              counter = 0;
                            },
                            child: const Text('Press to restart')),
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
