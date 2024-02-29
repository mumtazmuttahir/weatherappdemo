part of '../general_weather_screen.dart';

class MeasurementSection extends StatelessWidget {
  final double humidty;
  final double pressure;
  final double wind;
  const MeasurementSection({
    required this.humidty,
    required this.pressure,
    required this.wind,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> measurementNames = ['Humidty', 'Pressure', 'Wind'];
    final List<String> measurementSymbols = ['%', 'hPa', 'Km/h'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SubSection(
          subSectionName: measurementNames[0],
          subSectionMeasureValue: humidty,
          subSectionMeasureScale: measurementSymbols[0],
        ),
        SubSection(
          subSectionName: measurementNames[1],
          subSectionMeasureValue: pressure,
          subSectionMeasureScale: measurementSymbols[1],
        ),
        SubSection(
          subSectionName: measurementNames[2],
          subSectionMeasureValue: wind,
          subSectionMeasureScale: measurementSymbols[2],
        ),
      ],
    );
  }
}

class SubSection extends StatelessWidget {
  final String subSectionName;
  final String subSectionMeasureScale;
  final double subSectionMeasureValue;
  const SubSection({
    required this.subSectionName,
    required this.subSectionMeasureScale,
    required this.subSectionMeasureValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          subSectionName,
          style: OrganizationTextStyle.subTitle1
              .copyWith(color: OrganizationColors.secondary),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              subSectionMeasureValue.toInt().toString(),
              style: OrganizationTextStyle.body1,
            ),
            const HorizotalSpace(spaceLength: Spacing.space4),
            Text(
              subSectionMeasureScale,
              style: OrganizationTextStyle.body1,
            ),
          ],
        ),
      ],
    );
  }
}
