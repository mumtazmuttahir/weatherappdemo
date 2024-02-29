class CitiesList {
  final List<CityDesc> cities;
  const CitiesList({
    required this.cities,
  });
}

class CityDesc {
  final String name;
  final double latitude;
  final double longitude;

  const CityDesc({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}

CityDesc city1 =
    const CityDesc(name: 'Munich', latitude: 48.137154, longitude: 11.576124);
CityDesc city2 = const CityDesc(
    name: 'San Francisco', latitude: 37.773972, longitude: -122.431297);
CityDesc city3 =
    const CityDesc(name: 'Berlin', latitude: 52.520008, longitude: 13.404954);
CityDesc city4 =
    const CityDesc(name: 'Tokyo', latitude: 35.652832, longitude: 139.839478);
CityDesc city5 = const CityDesc(
    name: 'New York', latitude: 40.730610, longitude: -73.935242);

dynamic cities = [city1, city2, city3, city4, city5];

CitiesList listOfCities = CitiesList(cities: cities);
