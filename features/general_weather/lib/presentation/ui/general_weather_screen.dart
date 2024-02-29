import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_weather/configs/configs.dart';
import 'package:general_weather/domain/domain.dart';
import 'package:general_weather/domain/enums/enums.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchWeatherCubit, FetchWeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
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
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
