part of '../general_weather_screen.dart';

class DayDateSection extends StatelessWidget {
  final String day;
  final DateTime date;
  const DayDateSection({
    Key? key,
    required this.day,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(day),
        Text('${date.day} ${MonthName.getMonthName(date.month)} ${date.year}')
      ],
    );
  }
}
