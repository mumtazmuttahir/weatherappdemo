part of '../general_weather_screen.dart';

class SelectCitySection extends StatelessWidget {
  final String cityName;
  const SelectCitySection({required this.cityName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: ElevatedButton(
        onPressed: null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        child: SizedBox(
          width: 160,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.black,
              ),
              const HorizotalSpace(spaceLength: Spacing.space16),
              Text(cityName),
            ],
          ),
        ),
      ),
    );
  }
}
