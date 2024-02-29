part of '../general_weather_screen.dart';

class DayDateSection extends StatelessWidget {
  final String day;
  final String date;
  const DayDateSection({
    super.key,
    required this.day,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            day,
            style: OrganizationTextStyle.heading3,
          ),
          Text(
            date,
            style: OrganizationTextStyle.subTitle1
                .apply(color: OrganizationColors.secondary),
          )
        ],
      ),
    );
  }
}
