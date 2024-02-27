import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_weather/configs/configs.dart';
import 'package:general_weather/presentation/presentation.dart';
import 'package:http/http.dart';
import 'package:shared_design_components/colors/colors.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 96.0, bottom: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DayDateSection(
                day: 'FRIDAY',
                date: DateTime.now(),
              ),
              const VerticalSpace(spaceLength: Spacing.space24),
              const SelectCitySection(),
              const VerticalSpace(spaceLength: Spacing.space32),
              const WeatherSummary(
                temparature: 20,
                weatherCondition: 'cloudy',
              ),
              const VerticalSpace(spaceLength: Spacing.space32),
              const Divider(),
              const VerticalSpace(spaceLength: Spacing.space24),
              const MeasurementSection(
                humidty: 67,
                pressure: 1000,
                wind: 32,
              ),
              const VerticalSpace(spaceLength: Spacing.space24),
              const Divider(),
              const VerticalSpace(spaceLength: Spacing.space32),
              const ForecastSection(),
            ],
          ),
        ),
      ),
    );
  }
}
