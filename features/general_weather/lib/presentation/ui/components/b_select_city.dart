part of '../general_weather_screen.dart';

class SelectCitySection extends StatelessWidget {
  final String cityName;
  const SelectCitySection({required this.cityName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Container(
        width: 175,
        height: 40,
        decoration: BoxDecoration(
          color: OrganizationColors.secondaryBackground,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HorizotalSpace(spaceLength: Spacing.space4),
            const Icon(
              Icons.location_pin,
              color: OrganizationColors.primary,
            ),
            const HorizotalSpace(spaceLength: Spacing.space8),
            Text(
              cityName,
              style: OrganizationTextStyle.subTitle1,
            ),
          ],
        ),
      ),
    );
  }
}
