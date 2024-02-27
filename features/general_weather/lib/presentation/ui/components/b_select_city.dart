part of 'general_weather_screen.dart';

class SelectCitySection extends StatelessWidget {
  const SelectCitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              // side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        child: const SizedBox(
          width: 146,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.black,
              ),
              HorizotalSpace(spaceLength: Spacing.space16),
              Text('Stockholm'),
            ],
          ),
        ),
      ),
    );
  }
}
