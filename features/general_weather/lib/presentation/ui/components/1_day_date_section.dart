part of '../general_weather_screen.dart';

class DayDateSection extends StatelessWidget {
  final String day;
  final DateTime date;
  const DayDateSection({
    super.key,
    required this.day,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          day,
          style: OrganizationTextStyle.heading3,
        ),
        Text(
          '${date.day} ${MonthName.getMonthName(date.month)} ${date.year}',
          style: OrganizationTextStyle.subTitle1
              .apply(color: OrganizationColors.secondary),
        )
      ],
    );
  }
}
