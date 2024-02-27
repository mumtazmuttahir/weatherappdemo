part of '../general_weather_screen.dart';

class WeatherSummary extends StatelessWidget {
  final double temparature;
  final String weatherCondition;
  const WeatherSummary(
      {required this.temparature, required this.weatherCondition, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '20',
                    style: OrganizationTextStyle.heading1,
                  ),
                  Column(
                    children: [
                      Text(
                        '°',
                        style: OrganizationTextStyle.heading2,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Showers',
                style: OrganizationTextStyle.body2,
              ),
            ],
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 144,
                  width: 144,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 68),
                          SvgPicture.asset(
                            partialSun,
                            package: packageName,
                          ),
                        ],
                      ),
                      const SizedBox(height: 68),
                    ],
                  ),
                ),
                SizedBox(
                  height: 144,
                  width: 144,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          SvgPicture.asset(
                            cloud,
                            package: packageName,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 144,
                  width: 144,
                  child: Column(
                    children: [
                      const SizedBox(height: 110),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            rainDrop,
                            package: packageName,
                          ),
                          SvgPicture.asset(
                            rainDrop,
                            package: packageName,
                          ),
                          SvgPicture.asset(
                            rainDrop,
                            package: packageName,
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
