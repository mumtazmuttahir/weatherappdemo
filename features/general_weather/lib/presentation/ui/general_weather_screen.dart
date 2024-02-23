import 'package:flutter/material.dart';

class GeneralWeatherScreen extends StatefulWidget {
  const GeneralWeatherScreen({super.key});

  @override
  State<GeneralWeatherScreen> createState() => _GeneralWeatherScreenState();
}

class _GeneralWeatherScreenState extends State<GeneralWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('start'),
      ),
    );
  }
}
