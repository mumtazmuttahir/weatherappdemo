part of '../general_weather_screen.dart';

class ForecastSection extends StatelessWidget {
  const ForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> forecastDaysList = [
      'Fri',
      'Sat',
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (int index = 0; index < forecastDaysList.length; index++)
              (index == 0)
                  ? SingleDayForecastBox(
                      day: forecastDaysList[index],
                      backgroundColor: OrganizationColors.primaryAccent,
                      forgroundColor: OrganizationColors.pearl,
                      minimumTemparature: 14,
                      maximumTemparature: 21,
                    )
                  : SingleDayForecastBox(
                      day: forecastDaysList[index],
                      backgroundColor: OrganizationColors.secondaryBackground,
                      forgroundColor: OrganizationColors.primaryContent,
                      minimumTemparature: 14,
                      maximumTemparature: 21,
                    ),
          ],
        ),
      ),
    );
  }
}

class SingleDayForecastBox extends StatelessWidget {
  final String day;
  final Color backgroundColor;
  final Color forgroundColor;
  final List<String>? images;
  final int minimumTemparature;
  final int maximumTemparature;
  const SingleDayForecastBox(
      {required this.day,
      required this.backgroundColor,
      required this.forgroundColor,
      this.images,
      required this.minimumTemparature,
      required this.maximumTemparature,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 32.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: 139,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style:
                OrganizationTextStyle.heading4.copyWith(color: forgroundColor),
          ),
          Column(
            children: [
              SvgPicture.asset(
                cloud,
                package: packageName,
                width: 50,
                height: 27.5,
              ),
              SvgPicture.asset(
                ligthening,
                package: packageName,
                width: 50,
                height: 22.5,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$minimumTemparature',
                    style: OrganizationTextStyle.heading4
                        .copyWith(color: forgroundColor),
                  ),
                  Column(
                    children: [
                      Text(
                        '°',
                        style: OrganizationTextStyle.heading4
                            .copyWith(color: forgroundColor),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                ' / ',
                style: OrganizationTextStyle.heading4
                    .copyWith(color: forgroundColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$maximumTemparature',
                    style: OrganizationTextStyle.heading4
                        .copyWith(color: forgroundColor),
                  ),
                  Column(
                    children: [
                      Text(
                        '°',
                        style: OrganizationTextStyle.heading4
                            .copyWith(color: forgroundColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
