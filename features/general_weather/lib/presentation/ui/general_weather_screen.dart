import 'package:flutter/material.dart';
import 'package:general_weather/configs/configs.dart';
import 'package:general_weather/presentation/presentation.dart';

part 'components/day_date_section.dart';

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
          padding: const EdgeInsets.only(
              top: 96.0, left: 32.0, right: 32.0, bottom: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DayDateSection(
                day: 'FRIDAY',
                date: DateTime.now(),
              ),
              const VerticalSpace(spaceLength: Spacing.space16)
            ],
          ),
        ),
      ),
    );
  }
}
