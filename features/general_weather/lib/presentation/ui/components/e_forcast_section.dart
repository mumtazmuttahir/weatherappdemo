part of '../general_weather_screen.dart';

class ForecastSection extends StatelessWidget {
  final List<ForcastList>? forecastList;
  const ForecastSection({required this.forecastList, super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> forecastDaysList = [
    //   'Fri',
    //   'Sat',
    //   'Sun',
    //   'Mon',
    //   'Tue',
    //   'Wed',
    //   'Thu'
    // ];
    if (forecastList != null) {
      print('forecastList = ${forecastList!.length}');
      for (int index = 0; index < forecastList!.length; index++) {
        print(forecastList![index]);
      }
    } else {
      print('forecastList = 0');
    }
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
            if (forecastList == null) const SizedBox.shrink(),
            if (forecastList != null || forecastList!.isNotEmpty)
              for (int index = 0; index < forecastList!.length; index++)
                (index == 0)
                    ? SingleDayForecastBox(
                        day: Weekday.getWeekday(
                            DateTime.fromMillisecondsSinceEpoch(
                                    forecastList![0].dt * 1000)
                                .weekday),
                        backgroundColor: OrganizationColors.primaryAccent,
                        forgroundColor: OrganizationColors.pearl,
                        minimumTemparature:
                            forecastList![0].main.tempMin - 273.16,
                        maximumTemparature:
                            forecastList![0].main.tempMax - 273.16,
                      )
                    : SingleDayForecastBox(
                        day: Weekday.getWeekday(
                            DateTime.fromMillisecondsSinceEpoch(
                                    forecastList![index].dt * 1000)
                                .weekday),
                        backgroundColor: OrganizationColors.secondaryBackground,
                        forgroundColor: OrganizationColors.primaryContent,
                        minimumTemparature:
                            forecastList![index].main.tempMin - 273.16,
                        maximumTemparature:
                            forecastList![index].main.tempMax - 273.16,
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
  final double minimumTemparature;
  final double maximumTemparature;
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
                    '${minimumTemparature.toInt()}',
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
                    '${maximumTemparature.toInt()}',
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
